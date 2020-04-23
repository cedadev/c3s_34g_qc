#!/bin/bash

#
# updates the CMOR tables
# GITHUB_USER and GITHUB_PASSWORD should be passed in as environment variables.
#
# It might work without it, but there are limits on github API calls if not authenticated.
# 
. $(dirname $0)/../setup_esgprep.sh

esgfetchtables \
    --tables-dir $QC_TABLES_DIR \
    -p cmip6 \
    --branch-regex '[0-9.]+$'
