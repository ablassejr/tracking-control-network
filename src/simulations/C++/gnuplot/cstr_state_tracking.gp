if (!exists("csv")) csv = "cstr_state_tracking_cpp_output.csv"
if (!exists("outdir")) outdir = "`echo $IMAGES_DIR`"

set datafile separator ","
set terminal pngcairo size 1400,1050 enhanced font "Arial,24"
set grid

set xlabel "k (time steps)"
set xrange [0:45000]
set xtics 0,5000,45000

set output outdir."/cxxplot_time_vs_x1_r1.png"
set title "Conversion"
set ylabel "x_1, r_1"
set yrange [0:0.8]
set ytics 0,0.1,0.8
set key top right
plot csv using ($1/0.001):2 with lines lw 2 lc rgb "#0072BD" title "x_1", \
     csv using ($1/0.001):4 with lines lw 2 lc rgb "#EDB120" title "r_1"

set output outdir."/cxxplot_time_vs_x2_r2.png"
set title "Temperature"
set ylabel "x_2, r_2"
set yrange [0:5]
set ytics 0,0.5,5
set key top right
plot csv using ($1/0.001):3 with lines lw 2 lc rgb "#0072BD" title "x_2", \
     csv using ($1/0.001):5 with lines lw 2 lc rgb "#EDB120" title "r_2"
