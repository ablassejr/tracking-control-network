if (!exists("csv")) csv = "cstr_control_input_cpp_output.csv"
if (!exists("outdir")) outdir = "."

set datafile separator ","
set terminal png size 1200,900 enhanced font "Arial,14"

set xlabel "Time (s)"
set ylabel "u"

set output outdir."/cxxplot_fig2b.png"
set title "Control Input"
set xrange [0:45]
set xtics 0,5,45
set yrange [-350:400]
plot csv using 1:2 with lines lw 2 lc rgb "#0072BD" notitle

set output outdir."/cxxplot_fig2b_zoomed.png"
set title "Control Input (Zoomed 0.25-0.5s)"
set xrange [0.25:0.5]
set xtics autofreq
set yrange [-350:400]
plot csv using 1:2 with lines lw 2 lc rgb "#0072BD" notitle
