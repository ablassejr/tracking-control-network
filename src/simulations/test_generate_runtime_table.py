import tempfile
import unittest
from pathlib import Path

import generate_runtime_table as grt


class TestComputeStats(unittest.TestCase):
    def test_single_sample(self) -> None:
        stats = grt.compute_stats("test", [0.005])
        self.assertAlmostEqual(stats.avg, 0.005)

    def test_multi_sample_averages(self) -> None:
        stats = grt.compute_stats("test", [0.001, 0.002, 0.003])
        self.assertAlmostEqual(stats.avg, 0.002)


class TestRenderTable(unittest.TestCase):
    def _make_rows(self) -> list[grt.ComparisonRow]:
        matlab = grt.RuntimeStats(name="MATLAB", times=[0.15], avg=0.15)
        cpp = grt.RuntimeStats(name="C++", times=[0.015], avg=0.015)
        return [grt.ComparisonRow(simulation="Test", matlab=matlab, cpp=cpp, speedup=10.0)]

    def test_output_contains_booktabs(self) -> None:
        table = grt.render_latex_table(self._make_rows())
        self.assertIn("\\toprule", table)
        self.assertIn("\\midrule", table)
        self.assertIn("\\bottomrule", table)

    def test_output_has_balanced_environments(self) -> None:
        table = grt.render_latex_table(self._make_rows())
        self.assertEqual(table.count("\\begin{table}"), table.count("\\end{table}"))
        self.assertEqual(table.count("\\begin{tabular}"), table.count("\\end{tabular}"))

    def test_output_contains_speedup(self) -> None:
        table = grt.render_latex_table(self._make_rows())
        self.assertIn("10.0\\times", table)


class TestMain(unittest.TestCase):
    def test_main_generates_output_file(self) -> None:
        with tempfile.TemporaryDirectory() as tmp_dir:
            cpp_log = Path(tmp_dir) / "C++" / "cpp_output.log"
            cpp_log.parent.mkdir(parents=True)
            cpp_log.write_text("Execution time: 0.001 seconds\n")

            matlab_log = Path(tmp_dir) / "matlab" / "cstr" / "clean" / "matlab_output.log"
            matlab_log.parent.mkdir(parents=True)
            matlab_log.write_text("Elapsed time is 0.005 seconds.\n")

            attacked_cpp = Path(tmp_dir) / "C++" / "cpp_attacked_output.log"
            attacked_cpp.write_text("Execution time: 0.001 seconds\n")

            attacked_matlab = Path(tmp_dir) / "matlab" / "cstr" / "attacked" / "matlab_output.log"
            attacked_matlab.parent.mkdir(parents=True)
            attacked_matlab.write_text("Elapsed time is 0.3 seconds.\n")

            output = Path(tmp_dir) / "table.tex"
            rc = grt.main(["--base-dir", tmp_dir, "--output", str(output)])
            self.assertEqual(rc, 0)
            self.assertTrue(output.exists())
            content = output.read_text()
            self.assertIn("\\begin{table}", content)


if __name__ == "__main__":
    unittest.main()
