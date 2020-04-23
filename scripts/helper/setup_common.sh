# make some env vars available to other scripts
# points two levels up because this script is in scripts/helper

this_dir=$(dirname $BASH_SOURCE)
export QC_BASE_DIR=$(python -c "import os; print(os.path.realpath(\"$this_dir/../..\"))")
export QC_TABLES_DIR=$QC_BASE_DIR/tables
unset this_dir
