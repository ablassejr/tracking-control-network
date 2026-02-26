import tempfile
import unittest
from pathlib import Path

import plot_state_simulation_times as pst


class TestParseTimes(unittest.TestCase):
    def test_extract_reported_times_parses_cpp_and_matlab_formats(self) -> None:
        log_text = """
Execution time: 0.213 seconds
Noise line
Elapsed time is 0.321 seconds.
Execution time: 0.111 seconds
"""
        times = pst.extract_reported_times(log_text)
        self.assertEqual(times, [0.213, 0.321, 0.111])

    def test_calculate_average_requires_non_empty_values(self) -> None:
        with self.assertRaises(ValueError):
            pst.calculate_average([])

    def test_calculate_average_returns_expected_value(self) -> None:
        self.assertAlmostEqual(pst.calculate_average([1.0, 2.0, 3.0]), 2.0)


class TestChartGeneration(unittest.TestCase):
    def test_create_chart_writes_output_file(self) -> None:
        with tempfile.TemporaryDirectory() as tmp_dir:
            output_path = Path(tmp_dir) / "chart.svg"
            pst.create_chart(
                labels=["C++", "MATLAB"],
                averages=[0.15, 0.32],
                output_path=output_path,
                title="Average State Simulation Execution Time",
            )
            self.assertTrue(output_path.exists())
            self.assertGreater(output_path.stat().st_size, 0)


if __name__ == "__main__":
    unittest.main()
