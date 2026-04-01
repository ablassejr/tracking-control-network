#!/usr/bin/env python3
"""Create a chart from reported state simulation execution times."""

from __future__ import annotations

import argparse
import re
from html import escape
from pathlib import Path
from statistics import mean
from typing import Sequence

try:
    import matplotlib

    matplotlib.use("Agg")
    import matplotlib.pyplot as plt

    MATPLOTLIB_AVAILABLE = True
except Exception:
    MATPLOTLIB_AVAILABLE = False
    plt = None


TIME_PATTERN = re.compile(
    r"(?:Execution time:\s*|Elapsed time is\s*)"
    r"([+-]?\d+(?:\.\d+)?(?:[eE][+-]?\d+)?)\s*seconds\.?",
    re.IGNORECASE,
)


def extract_reported_times(log_text: str) -> list[float]:
    """Extract all reported execution times in seconds from log text."""
    return [float(value) for value in TIME_PATTERN.findall(log_text)]


def calculate_average(values: Sequence[float]) -> float:
    """Calculate the average of a non-empty sequence of values."""
    if not values:
        raise ValueError("Cannot calculate average of an empty sequence.")
    return mean(values)


def load_times_from_log(log_path: Path) -> list[float]:
    """Load a log file and parse reported execution times from it."""
    log_text = log_path.read_text(encoding="utf-8")
    times = extract_reported_times(log_text)
    if not times:
        raise ValueError(f"No execution times found in {log_path}")
    return times


def create_chart(
    labels: Sequence[str],
    averages: Sequence[float],
    output_path: Path,
    title: str,
) -> None:
    """Create and save a bar chart of average execution times."""
    if not MATPLOTLIB_AVAILABLE:
        if output_path.suffix.lower() != ".svg":
            raise RuntimeError(
                "matplotlib is not installed. Install it with "
                "`python3 -m pip install matplotlib` or use an SVG output "
                "path such as `--output chart.svg`."
            )
        _create_svg_chart(labels=labels, averages=averages, output_path=output_path, title=title)
        return

    fig, ax = plt.subplots(figsize=(8, 5))
    colors = ["#386FA4", "#F9A03F", "#4AABAF", "#D1495B"]
    bars = ax.bar(labels, averages, color=colors[: len(labels)])

    ax.set_title(title)
    ax.set_ylabel("Average Execution Time (seconds)")
    ax.grid(axis="y", linestyle="--", alpha=0.35)

    for bar, value in zip(bars, averages):
        ax.text(
            bar.get_x() + bar.get_width() / 2,
            bar.get_height(),
            f"{value:.6f}s",
            ha="center",
            va="bottom",
            fontsize=14,
        )

    fig.tight_layout()
    output_path.parent.mkdir(parents=True, exist_ok=True)
    fig.savefig(output_path, dpi=200)
    plt.close(fig)


def _create_svg_chart(
    labels: Sequence[str],
    averages: Sequence[float],
    output_path: Path,
    title: str,
) -> None:
    """Create and save a simple SVG bar chart without external dependencies."""
    if len(labels) != len(averages):
        raise ValueError("labels and averages must have the same length.")
    if not averages:
        raise ValueError("At least one average value is required to create a chart.")

    width = 900
    height = 560
    margin_left = 90
    margin_right = 40
    margin_top = 90
    margin_bottom = 90
    chart_width = width - margin_left - margin_right
    chart_height = height - margin_top - margin_bottom

    max_value = max(averages)
    if max_value <= 0:
        max_value = 1.0

    bar_count = len(averages)
    bar_width = chart_width / (bar_count * 1.8)
    gap = (chart_width - (bar_width * bar_count)) / (bar_count + 1)
    colors = ["#386FA4", "#F9A03F", "#4AABAF", "#D1495B"]

    elements: list[str] = []
    elements.append(f'<rect x="0" y="0" width="{width}" height="{height}" fill="white" />')
    elements.append(
        f'<text x="{width / 2}" y="45" text-anchor="middle" '
        f'font-family="Helvetica, Arial, sans-serif" font-size="26" fill="#111">'
        f"{escape(title)}</text>"
    )
    elements.append(
        f'<text x="{margin_left - 55}" y="{margin_top - 20}" text-anchor="start" '
        f'font-family="Helvetica, Arial, sans-serif" font-size="14" fill="#333">'
        "Seconds</text>"
    )

    for tick in range(6):
        ratio = tick / 5
        y = margin_top + chart_height - (ratio * chart_height)
        tick_value = max_value * ratio
        elements.append(
            f'<line x1="{margin_left}" y1="{y:.2f}" x2="{width - margin_right}" y2="{y:.2f}" '
            'stroke="#e4e7eb" stroke-width="1" />'
        )
        elements.append(
            f'<text x="{margin_left - 12}" y="{y + 4:.2f}" text-anchor="end" '
            'font-family="Helvetica, Arial, sans-serif" font-size="12" fill="#4a4a4a">'
            f"{tick_value:.3f}</text>"
        )

    elements.append(
        f'<line x1="{margin_left}" y1="{margin_top + chart_height}" '
        f'x2="{width - margin_right}" y2="{margin_top + chart_height}" '
        'stroke="#888" stroke-width="1.5" />'
    )
    elements.append(
        f'<line x1="{margin_left}" y1="{margin_top}" '
        f'x2="{margin_left}" y2="{margin_top + chart_height}" '
        'stroke="#888" stroke-width="1.5" />'
    )

    for index, (label, value) in enumerate(zip(labels, averages)):
        x = margin_left + gap * (index + 1) + bar_width * index
        bar_height = (value / max_value) * chart_height
        y = margin_top + chart_height - bar_height
        color = colors[index % len(colors)]
        elements.append(
            f'<rect x="{x:.2f}" y="{y:.2f}" width="{bar_width:.2f}" height="{bar_height:.2f}" '
            f'fill="{color}" rx="3" ry="3" />'
        )
        elements.append(
            f'<text x="{x + bar_width / 2:.2f}" y="{margin_top + chart_height + 28}" '
            'text-anchor="middle" font-family="Helvetica, Arial, sans-serif" '
            f'font-size="14" fill="#222">{escape(label)}</text>'
        )
        elements.append(
            f'<text x="{x + bar_width / 2:.2f}" y="{y - 8:.2f}" text-anchor="middle" '
            'font-family="Helvetica, Arial, sans-serif" font-size="12" fill="#111">'
            f"{value:.6f}s</text>"
        )

    svg = (
        '<?xml version="1.0" encoding="UTF-8"?>\n'
        f'<svg xmlns="http://www.w3.org/2000/svg" width="{width}" height="{height}" '
        f'viewBox="0 0 {width} {height}">\n'
        + "\n".join(elements)
        + "\n</svg>\n"
    )
    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text(svg, encoding="utf-8")


def parse_args(argv: Sequence[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Build a chart from reported state simulation execution times for "
            "C++ and MATLAB implementations."
        )
    )
    parser.add_argument("--cpp-log", type=Path, required=True, help="Path to C++ log file.")
    parser.add_argument(
        "--matlab-log",
        type=Path,
        required=True,
        help="Path to MATLAB log file.",
    )
    parser.add_argument(
        "--output",
        type=Path,
        default=Path("avg_state_simulation_execution_times.svg"),
        help="Output chart path (default: avg_state_simulation_execution_times.svg).",
    )
    parser.add_argument(
        "--title",
        default="Average State Simulation Execution Time",
        help="Chart title.",
    )
    return parser.parse_args(argv)


def main(argv: Sequence[str] | None = None) -> int:
    args = parse_args(argv)

    cpp_times = load_times_from_log(args.cpp_log)
    matlab_times = load_times_from_log(args.matlab_log)

    labels = ["C++", "MATLAB"]
    averages = [calculate_average(cpp_times), calculate_average(matlab_times)]
    create_chart(labels=labels, averages=averages, output_path=args.output, title=args.title)

    print(f"C++ average: {averages[0]:.6f} seconds ({len(cpp_times)} samples)")
    print(f"MATLAB average: {averages[1]:.6f} seconds ({len(matlab_times)} samples)")
    print(f"Saved chart: {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
