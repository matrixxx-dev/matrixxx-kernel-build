#!/bin/bash

## ########################################################################## ##
##
## get "advanced multi layered unification filesystem" (aufs) tools repository
##
## ########################################################################## ##
## includes:
. ./init

## defines:
CALLEE="$1"

## -------------------------------------------------------------------------- ##
## MAIN:
## -------------------------------------------------------------------------- ##
## change to build directory
func_change_to_dir "${BUILD_DIR}"

## generate local git repository
## note: will not be executed if the directory already exists
git clone "${REMOTE_URL}" "${GIT_REPOSITORY_NAME}"

## -------------------------------------------------------------------------- ##
## pause:
func_pause

## ########################################################################## ##
exit 0
