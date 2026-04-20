if (!exists("csv")) csv = "cstr_control_input_cpp_output.csv"
if (!exists("outdir")) outdir = "`echo $IMAGES_DIR`"

set datafile separator ","
set terminal pngcairo size 1400,1050 enhanced font "Arial,24"
set grid

set xlabel "k"
set ylabel "u"

set output outdir."/cxxplot_fig2b.png"
set xrange [0:45000]
set xtics 0,5000,45000
set yrange [-350:400]
plot csv using ($1/0.001):2 with lines lw 2 lc rgb "#0072BD" notitle

set output outdir."/cxxplot_fig2b_zoomed.png"
set xrange [0:100]
set xtics 0,20,100
set yrange [-350:400]
plot csv using ($1/0.001):2 with lines lw 2 lc rgb "#0072BD" notitle
