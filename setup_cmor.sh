# source this to setup the qc environment containing PrePARE

dir=$(dirname $BASH_SOURCE)
. $dir/clean_setup.sh
. $dir/scripts/helper/setup_common.sh
PATH=$dir/miniconda3/bin:$PATH
source activate qc
unset dir
