#!/bin/bash

## ########################################################################## ##
##
## save results of the kernel build process
##
## ########################################################################## ##
## includes:
. ./init
. ../lib/func_kernel-build-handling

## defines:
CALLEE="$1"

## -------------------------------------------------------------------------- ##
## FUNCTIONS:
## -------------------------------------------------------------------------- ##
func_build_storage(){ # storage="$1"
  local storage
  storage="$1"
  [ -d "${storage}" ] || mkdir -p "${storage}"
  #readarray -t array < <(find ./* -maxdepth 0 -type f -exec basename {} ';')
  readarray -t array < <(find ./* -maxdepth 0 -type f)

  for file in "${array[@]}"
  do
    mv "${file}" "${storage}"/
  done
}

## -------------------------------------------------------------------------- ##
## MAIN:
## -------------------------------------------------------------------------- ##
## change to build directory
func_change_to_dir "${BUILD_DIR}"

## define the STORAGE_DIR
func_set_system_architecture
STORAGE_DIR="${RELEASE_TAG}${M_TYPE}"

## save results of the kernel build process
func_build_storage "${STORAGE_DIR}"

## -------------------------------------------------------------------------- ##
## pause:
func_pause

## ########################################################################## ##
exit 0
