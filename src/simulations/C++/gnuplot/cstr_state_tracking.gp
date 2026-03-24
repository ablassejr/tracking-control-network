if (!exists("csv")) csv = "cstr_state_tracking_cpp_output.csv"
if (!exists("outdir")) outdir = "."

set datafile separator ","
set terminal png size 1200,900 enhanced font "Arial,14"

set xlabel "Time (s)"
set xrange [0:45]
set xtics 0,5,45

set output outdir."/cxxplot_time_vs_x1_r1.png"
set title "Conversion"
set ylabel "x_1, r_1"
set yrange [0:0.8]
set ytics 0,0.1,0.8
set key top right
plot csv using 1:2 with lines lw 2 lc rgb "#0072BD" title "x_1", \
     csv using 1:4 with lines lw 2 lc rgb "#D95319" title "r_1"

set output outdir."/cxxplot_time_vs_x2_r2.png"
set title "Temperature"
set ylabel "x_2, r_2"
set yrange [0:5]
set ytics 0,0.5,5
set key top right
plot csv using 1:3 with lines lw 2 lc rgb "#0072BD" title "x_2", \
     csv using 1:5 with lines lw 2 lc rgb "#D95319" title "r_2"
