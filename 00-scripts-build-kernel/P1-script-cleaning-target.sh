#!/bin/bash

## ########################################################################## ##
##
## Build Kernel - build a kernel
## - use git path for object files
##
## relevant buildtypes:
## deb-pkg             - Build both source and binary deb kernel packages
## bindeb-pkg          - Build only the binary kernel deb package
##
## ########################################################################## ##

## includes
source ./init
source ../lib/func_kernel-build-handling

## defines:
CALLEE="$1"
#DEBUG="true"         ## set cpu_jobs="-j 1"

## -------------------------------------------------------------------------- ##
## FUNCTIONS:
## -------------------------------------------------------------------------- ##
## Let’s go build kernel:
func_build_process(){ # git_repository="$1"
  local git_repository clean_target
  git_repository="$1"

  #clean_target="-j mrproper"
  clean_target="-j distclean"

  ## --------------------------
  cd "${git_repository}" || exit 1

  ## clean the target
  cmd="make ${clean_target}"; echo "${cmd}"
  eval "${cmd}"

  cd "${SCRIPT_PATH}" || exit 1
  ## --------------------------
}

## -------------------------------------------------------------------------- ##
## MAIN:
## -------------------------------------------------------------------------- ##
## change to build directory
func_change_to_dir "${BUILD_DIR}"

## build the new kernel
func_build_process "${GIT_REPOSITORY_NAME}"


## -------------------------------------------------------------------------- ##
## pause:
func_pause

## ########################################################################## ##
exit 0
