# source this to remove any existing setup of these environments
#
if [ ! -z "$CONDA_DEFAULT_ENV" ]
then
    conda deactivate
fi

PATH=$($(dirname $BASH_SOURCE)/scripts/helper/clean_path.py)
unset QC_BASEDIR
unset QC_TABLES_DIR
