#!/bin/bash

## ########################################################################## ##
##
## Clean aufs-util repository
##
## ########################################################################## ##
## includes:
. ./init

## -------------------------------------------------------------------------- ##
## FUNCTIONS:
## -------------------------------------------------------------------------- ##

## -------------------------------------------------------------------------- ##
## MAIN:
## -------------------------------------------------------------------------- ##
## change to build directory
func_change_to_dir "${BUILD_DIR}"

## set local git repository to default
cd "${GIT_REPOSITORY_NAME}" || exit 1

make clean


## -------------------------------------------------------------------------- ##
## pause:
echo "Press enter to continue..."; read -r

## ########################################################################## ##
exit 0
