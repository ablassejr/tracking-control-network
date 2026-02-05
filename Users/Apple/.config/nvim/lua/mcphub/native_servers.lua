local function stub_server(name)
  return {
    name = name,
    displayName = name,
    capabilities = {
      tools = {
        {
          name = "ping",
          description = "Stub native proxy; use remote server for real actions",
          handler = function(req, res)
            local caller = req.caller and req.caller.type or "unknown"
            return res
              :text(string.format("Native stub for %s. Caller: %s. This just proves the server is registered; use the remote server for real functionality.", name, caller))
              :send()
          end,
        },
      },
      resources = {},
      resourceTemplates = {},
      prompts = {},
    },
  }
end

return {
  browser_tools = stub_server("browser_tools"),
  ["claude-context"] = stub_server("claude-context"),
  e2b = stub_server("e2b"),
  fetch = stub_server("fetch"),
  github = stub_server("github"),
  context7 = stub_server("context7"),
  postgres = stub_server("postgres"),
  puppeteer = stub_server("puppeteer"),
  sequentialthinking = stub_server("sequentialthinking"),
  task_master = stub_server("task_master"),
  memory = stub_server("memory"),
  neovim = stub_server("neovim"),
  mcphub = stub_server("mcphub"),
  paper_search = stub_server("paper_search"),
  playwright = stub_server("playwright"),
}
