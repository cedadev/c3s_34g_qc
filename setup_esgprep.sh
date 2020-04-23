# source this to set up the esgprep conda environment (including esgfetchtables)

dir=$(dirname $BASH_SOURCE)
. $dir/clean_setup.sh
. $dir/scripts/helper/setup_common.sh
PATH=$dir/miniconda2/bin:$PATH
source activate esgprep
unset dir
