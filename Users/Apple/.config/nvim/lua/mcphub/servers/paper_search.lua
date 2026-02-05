local M = {}

local uv = vim.loop

local function system_json(cmd)
  local obj = vim.system(cmd, { text = true }):wait()
  if obj.code ~= 0 then
    return nil, table.concat(obj.stderr or {}, "\n")
  end
  local out = table.concat(obj.stdout or {}, "\n")
  local ok, decoded = pcall(vim.json.decode, out)
  if not ok then
    return nil, "failed to decode json"
  end
  return decoded, nil
end

local function system_text(cmd)
  local obj = vim.system(cmd, { text = true }):wait()
  if obj.code ~= 0 then
    return nil, table.concat(obj.stderr or {}, "\n")
  end
  return table.concat(obj.stdout or {}, "\n"), nil
end

local function ensure_dir(path)
  local stat = uv.fs_stat(path)
  if stat and stat.type == "directory" then
    return true
  end
  return uv.fs_mkdir(path, 448) -- 0700
end

local function safe_path(base, filename)
  return base .. "/" .. filename
end

local function parse_arxiv_atom(atom)
  local entries = {}
  for entry in atom:gmatch("<entry>(.-)</entry>") do
    local id = entry:match("<id>(.-)</id>") or ""
    local title = entry:match("<title>(.-)</title>") or ""
    local summary = entry:match("<summary>(.-)</summary>") or ""
    local published = entry:match("<published>(.-)</published>") or ""
    local updated = entry:match("<updated>(.-)</updated>") or ""
    local pdf_url = entry:match("href=\"(.-pdf)\"") or ""
    local authors = {}
    for author in entry:gmatch("<author>.-<name>(.-)</name>.-</author>") do
      table.insert(authors, author)
    end
    table.insert(entries, {
      id = id,
      title = vim.trim(title:gsub("%s+", " ")),
      summary = vim.trim(summary:gsub("%s+", " ")),
      published = published,
      updated = updated,
      authors = authors,
      pdf_url = pdf_url,
      source = "arxiv",
    })
  end
  return entries
end

local function search_arxiv(query, max_results)
  local url = string.format(
    "https://export.arxiv.org/api/query?search_query=all:%s&start=0&max_results=%d",
    vim.fn.escape(query, " "),
    max_results or 10
  )
  local body, err = system_text({ "curl", "-sL", "--max-time", "20", url })
  if not body then
    return nil, err
  end
  return parse_arxiv_atom(body), nil
end

local function search_crossref(opts)
  local params = {
    { "query", opts.query },
    { "rows", tostring(opts.max_results or 10) },
  }
  if opts.filter then
    table.insert(params, { "filter", opts.filter })
  end
  if opts.sort then
    table.insert(params, { "sort", opts.sort })
  end
  if opts.order then
    table.insert(params, { "order", opts.order })
  end
  local qs = {}
  for _, kv in ipairs(params) do
    table.insert(qs, kv[1] .. "=" .. vim.fn.escape(kv[2], " "))
  end
  local url = "https://api.crossref.org/works?" .. table.concat(qs, "&")
  local data, err = system_json({ "curl", "-sL", "--max-time", "20", url })
  if not data then
    return nil, err
  end
  local items = data.message and data.message.items or {}
  local papers = {}
  for _, item in ipairs(items) do
    table.insert(papers, {
      id = item.DOI,
      doi = item.DOI,
      title = type(item.title) == "table" and item.title[1] or item.title,
      authors = item.author or {},
      published = item.created and item.created["date-time"] or nil,
      url = item.URL,
      abstract = item.abstract,
      source = "crossref",
    })
  end
  return papers, nil
end

local function get_crossref_by_doi(doi)
  local url = "https://api.crossref.org/works/" .. doi
  local data, err = system_json({ "curl", "-sL", "--max-time", "20", url })
  if not data then
    return nil, err
  end
  local item = data.message or {}
  return {
    id = item.DOI,
    doi = item.DOI,
    title = type(item.title) == "table" and item.title[1] or item.title,
    authors = item.author or {},
    published = item.created and item.created["date-time"] or nil,
    url = item.URL,
    abstract = item.abstract,
    source = "crossref",
  }
end

local function search_pubmed(query, max_results)
  local esearch_url = string.format(
    "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=pubmed&retmode=json&retmax=%d&term=%s",
    max_results or 10,
    query
  )
  local esearch, err = system_json({ "curl", "-sL", "--max-time", "20", esearch_url })
  if not esearch or not esearch.esearchresult or not esearch.esearchresult.idlist then
    return nil, err or "no ids"
  end
  local ids = esearch.esearchresult.idlist
  if #ids == 0 then
    return {}, nil
  end
  local summary_url = string.format(
    "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esummary.fcgi?db=pubmed&retmode=json&id=%s",
    table.concat(ids, ",")
  )
  local summary, err2 = system_json({ "curl", "-sL", "--max-time", "20", summary_url })
  if not summary or not summary.result then
    return nil, err2 or "no summary"
  end
  local result = summary.result
  local papers = {}
  for _, id in ipairs(ids) do
    local item = result[id]
    if item then
      table.insert(papers, {
        id = id,
        title = item.title,
        authors = item.authors,
        published = item.pubdate,
        source = "pubmed",
        url = "https://pubmed.ncbi.nlm.nih.gov/" .. id .. "/",
      })
    end
  end
  return papers, nil
end

local function download_arxiv_pdf(paper_id, save_path)
  ensure_dir(save_path)
  local url = string.format("https://arxiv.org/pdf/%s.pdf", paper_id)
  local out_path = safe_path(save_path, paper_id:gsub("/", "_") .. ".pdf")
  local res = vim.system({ "curl", "-sL", "--max-time", "60", "-o", out_path, url }):wait()
  if res.code ~= 0 then
    return nil, table.concat(res.stderr or {}, "\n")
  end
  return out_path, nil
end

local function read_pdf(path)
  local ok = vim.fn.executable("pdftotext") == 1
  if not ok then
    return nil, "pdftotext not available"
  end
  local txt_path = path .. ".txt"
  local res = vim.system({ "pdftotext", path, txt_path }):wait()
  if res.code ~= 0 then
    return nil, table.concat(res.stderr or {}, "\n")
  end
  local text, err = system_text({ "cat", txt_path })
  if not text then
    return nil, err
  end
  return text, nil
end

local function best_effort_google_scholar()
  return nil, "Google Scholar scraping is brittle and not implemented in this native server"
end

local function not_supported(reason)
  return nil, reason
end

M.name = "paper_search"
M.displayName = "Paper Search (native)"
M.capabilities = {
  tools = {
    {
      name = "search_arxiv",
      description = "Search arXiv papers by query",
      inputSchema = {
        type = "object",
        properties = {
          query = { type = "string" },
          max_results = { type = "integer", default = 10 },
        },
        required = { "query" },
      },
      handler = function(req, res)
        local papers, err = search_arxiv(req.params.query, req.params.max_results)
        if not papers then
          return res:error("arxiv search failed", { err = err })
        end
        return res:text(vim.json.encode(papers), "application/json"):send()
      end,
    },
    {
      name = "search_crossref",
      description = "Search CrossRef metadata",
      inputSchema = {
        type = "object",
        properties = {
          query = { type = "string" },
          max_results = { type = "integer", default = 10 },
          filter = { type = "string" },
          sort = { type = "string" },
          order = { type = "string" },
        },
        required = { "query" },
      },
      handler = function(req, res)
        local papers, err = search_crossref(req.params)
        if not papers then
          return res:error("crossref search failed", { err = err })
        end
        return res:text(vim.json.encode(papers), "application/json"):send()
      end,
    },
    {
      name = "get_crossref_paper_by_doi",
      description = "Get a CrossRef paper by DOI",
      inputSchema = {
        type = "object",
        properties = {
          doi = { type = "string" },
        },
        required = { "doi" },
      },
      handler = function(req, res)
        local paper, err = get_crossref_by_doi(req.params.doi)
        if not paper then
          return res:error("crossref lookup failed", { err = err })
        end
        return res:text(vim.json.encode(paper), "application/json"):send()
      end,
    },
    {
      name = "search_pubmed",
      description = "Search PubMed (E-utilities)",
      inputSchema = {
        type = "object",
        properties = {
          query = { type = "string" },
          max_results = { type = "integer", default = 10 },
        },
        required = { "query" },
      },
      handler = function(req, res)
        local papers, err = search_pubmed(req.params.query, req.params.max_results)
        if not papers then
          return res:error("pubmed search failed", { err = err })
        end
        return res:text(vim.json.encode(papers), "application/json"):send()
      end,
    },
    {
      name = "search_google_scholar",
      description = "Best-effort Google Scholar (not implemented)",
      inputSchema = {
        type = "object",
        properties = { query = { type = "string" }, max_results = { type = "integer", default = 10 } },
        required = { "query" },
      },
      handler = function(_, res)
        local _, err = best_effort_google_scholar()
        return res:error(err or "not implemented")
      end,
    },
    {
      name = "search_biorxiv",
      description = "bioRxiv search (not implemented)",
      handler = function(_, res)
        return res:error("bioRxiv search not implemented in this native server")
      end,
    },
    {
      name = "search_medrxiv",
      description = "medRxiv search (not implemented)",
      handler = function(_, res)
        return res:error("medRxiv search not implemented in this native server")
      end,
    },
    {
      name = "search_iacr",
      description = "IACR search (not implemented)",
      handler = function(_, res)
        return res:error("IACR search not implemented in this native server")
      end,
    },
    {
      name = "search_semantic",
      description = "Semantic Scholar search (API key not provided)",
      inputSchema = {
        type = "object",
        properties = {
          query = { type = "string" },
          year = { type = "string" },
          max_results = { type = "integer", default = 10 },
        },
        required = { "query" },
      },
      handler = function(_, res)
        return res:error("Semantic Scholar search requires an API key; not configured")
      end,
    },
    {
      name = "download_arxiv",
      description = "Download arXiv PDF",
      inputSchema = {
        type = "object",
        properties = {
          paper_id = { type = "string" },
          save_path = { type = "string", default = vim.fn.stdpath("data") .. "/mcphub/papers" },
        },
        required = { "paper_id" },
      },
      handler = function(req, res)
        local path, err = download_arxiv_pdf(req.params.paper_id, req.params.save_path)
        if not path then
          return res:error("download failed", { err = err })
        end
        return res:text(path):send()
      end,
    },
    {
      name = "download_pubmed",
      description = "PubMed PDF download not supported",
      handler = function(_, res)
        return res:error("PubMed direct PDF download not supported")
      end,
    },
    {
      name = "download_biorxiv",
      description = "bioRxiv download not implemented",
      handler = function(_, res)
        return res:error("bioRxiv download not implemented")
      end,
    },
    {
      name = "download_medrxiv",
      description = "medRxiv download not implemented",
      handler = function(_, res)
        return res:error("medRxiv download not implemented")
      end,
    },
    {
      name = "download_iacr",
      description = "IACR download not implemented",
      handler = function(_, res)
        return res:error("IACR download not implemented")
      end,
    },
    {
      name = "download_semantic",
      description = "Semantic Scholar download not implemented",
      handler = function(_, res)
        return res:error("Semantic Scholar download not implemented (no API key)")
      end,
    },
    {
      name = "download_crossref",
      description = "CrossRef is metadata-only; PDF download not supported",
      handler = function(_, res)
        return res:error("CrossRef is metadata-only; PDF download not supported")
      end,
    },
    {
      name = "read_arxiv_paper",
      description = "Download + extract text from arXiv PDF (requires pdftotext)",
      inputSchema = {
        type = "object",
        properties = {
          paper_id = { type = "string" },
          save_path = { type = "string", default = vim.fn.stdpath("data") .. "/mcphub/papers" },
        },
        required = { "paper_id" },
      },
      handler = function(req, res)
        local path, err = download_arxiv_pdf(req.params.paper_id, req.params.save_path)
        if not path then
          return res:error("download failed", { err = err })
        end
        local text, err2 = read_pdf(path)
        if not text then
          return res:error("read failed", { err = err2 })
        end
        return res:text(text):send()
      end,
    },
    {
      name = "read_pubmed_paper",
      description = "PubMed read not supported",
      handler = function(_, res)
        return res:error("PubMed read not supported")
      end,
    },
    {
      name = "read_biorxiv_paper",
      description = "bioRxiv read not implemented",
      handler = function(_, res)
        return res:error("bioRxiv read not implemented")
      end,
    },
    {
      name = "read_medrxiv_paper",
      description = "medRxiv read not implemented",
      handler = function(_, res)
        return res:error("medRxiv read not implemented")
      end,
    },
    {
      name = "read_iacr_paper",
      description = "IACR read not implemented",
      handler = function(_, res)
        return res:error("IACR read not implemented")
      end,
    },
    {
      name = "read_semantic_paper",
      description = "Semantic Scholar read not implemented",
      handler = function(_, res)
        return res:error("Semantic Scholar read not implemented (no API key)")
      end,
    },
    {
      name = "read_crossref_paper",
      description = "CrossRef is metadata-only; read not supported",
      handler = function(_, res)
        return res:error("CrossRef is metadata-only; read not supported")
      end,
    },
  },
}

return M
