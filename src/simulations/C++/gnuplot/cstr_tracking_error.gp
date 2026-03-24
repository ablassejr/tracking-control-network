if (!exists("csv")) csv = "cstr_tracking_error_cpp_output.csv"
if (!exists("outdir")) outdir = "."

set datafile separator ","
set terminal png size 1200,900 enhanced font "Arial,14"

set xlabel "Time (s)"
set xrange [0:45]
set xtics 0,5,45

set output outdir."/cxxplot_fig2c_e1.png"
set title "Tracking Error e_1"
set ylabel "e_1"
set yrange [-0.5:0.4]
plot csv using 1:2 with lines lw 2 lc rgb "#77AC30" notitle

set output outdir."/cxxplot_fig2c_e2.png"
set title "Tracking Error e_2"
set ylabel "e_2"
set yrange [-3:2.5]
plot csv using 1:3 with lines lw 2 lc rgb "#77AC30" notitle
