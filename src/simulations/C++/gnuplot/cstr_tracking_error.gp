if (!exists("csv")) csv = "cstr_tracking_error_cpp_output.csv"
if (!exists("outdir")) outdir = "`echo $IMAGES_DIR`"

set datafile separator ","
set terminal pngcairo size 1400,1050 enhanced font "Arial,24"
set grid

set xlabel "k"
set xrange [0:45000]
set xtics 0,5000,45000

set output outdir."/cxxplot_fig2c_e1.png"
set title "Tracking Error e_1"
set ylabel "e_1"
set yrange [-0.5:0.4]
plot csv using ($1/0.001):2 with lines lw 2 lc rgb "#7E2F8E" notitle

set output outdir."/cxxplot_fig2c_e2.png"
set title "Tracking Error e_2"
set ylabel "e_2"
set yrange [-3:2.5]
set ytics -3, 0.5, 2.5
plot csv using ($1/0.001):3 with lines lw 2 lc rgb "#7E2F8E" notitle
