if (!exists("csv")) csv = "cstr_control_input_cpp_output.csv"
if (!exists("outdir")) outdir = "`echo $IMAGES_DIR`"

set datafile separator ","
set grid

set lmargin at screen 0.14
set rmargin at screen 0.96
set tmargin at screen 0.96
set bmargin at screen 0.18

set ylabel "u"
set yrange [-350:400]
set ytics -300,100,400

set terminal pngcairo size 2417,1544 enhanced font "Arial,64"
set output outdir."/cxxplot_fig2b_comparison.png"
set xlabel "k (time steps)                          {/Symbol \264}10^{4}"
set xrange [0:4.5]
set xtics 0,1,4
plot csv using ($1/0.001/10000):2 with lines lw 2 lc rgb "#0072BD" notitle

set terminal pngcairo size 2489,1554 enhanced font "Arial,64"
set output outdir."/cxxplot_fig2b_zoomed_comparison.png"
set xlabel "k (time steps)"
set xrange [0:100]
set xtics 0,20,100
plot csv using ($1/0.001):2 with lines lw 2 lc rgb "#0072BD" notitle
