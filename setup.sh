#!/bin/bash

# Define variables used in all scripts if not already set
if [[ -z "$WORKSPACE" ]]
  then
    export WORKSPACE=`pwd`
fi

if [[ -z "$PIP_DOWNLOAD_CACHE" ]]
  then
    export PIP_DOWNLOAD_CACHE=~/.pip_cache
fi

# Activate Virtualenv
cd $WORKSPACE/src
virtualenv-2.7 virtenv
source virtenv/bin/activate

$WORKSPACE/python-dep-install.sh
$WORKSPACE/pylucene-install.sh

# Create project directories
cd $WORKSPACE/src
mkdir -p media/{bills,resources}
mkdir -p wstore/search/index

$WORKSPACE/coverage.sh