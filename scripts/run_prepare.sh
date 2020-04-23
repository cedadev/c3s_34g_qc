#!/bin/sh

# run PrePARE on a set of files
# only the first one is inspected for the data_specs_version so it should
# be used on homogeneous files e.g. a time series, or otherwise invoked
# once per file

# if --try-first option is given, then it will run PrePARE on just the
# first file, and only continue to the (parallel) check of the remaining 
# files if this succeeded

. $(dirname $0)/../setup_cmor.sh

try_first=0
while true
do
    case $1 in
	--try-first)
	    try_first=1
	    ;;
	-*)
	    echo "Unrecognised option: $1"
	    exit 1
	    ;;
	*) 
	    break
	    ;;
    esac
    shift
done

first_file=$1

table_version=$(ncdump -h $first_file | awk -F\" '/data_specs_version/{print $2}')
tables_dir=$QC_TABLES_DIR/cmip6-cmor-tables/$table_version

if [ -z "$table_version" ]
then
    echo "$first_file does not specify data_specs_version"
    exit 1
fi

if [ ! -d "$tables_dir" ]
then
    echo "tables directory $tables_dir implied by data_specs_version in $first_file does not exist"
    exit 1
fi

opts="--table-path=$tables_dir"

if [ $try_first -eq 0 ]
then
    PrePARE $opts "$@"
    status=$?
else
    echo "Running PrePARE on first file"
    PrePARE $opts $first_file
    status=$?
    if [ $status -ne 0 ]
    then
	echo "Failed on first file (status $status) - aborting"
	exit $status
    fi
    shift
    echo "Running PrePARE on remaining files"
    PrePARE $opts "$@"
fi

if [ $status -eq 0 ]
then
    echo "Success"
else
    echo "Failed (status $status)"
fi
exit $status
