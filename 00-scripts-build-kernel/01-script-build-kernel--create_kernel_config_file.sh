#!/bin/bash

## ########################################################################## ##
##
## Build Kernel - generate a kernel config file
## - use git path for object files
##
## ########################################################################## ##

## includes
source ./init
source ../lib/func_kernel-build-handling

## defines:
CALLEE="$1"

## -------------------------------------------------------------------------- ##
## FUNCTIONS:
## -------------------------------------------------------------------------- ##
## Let’s go configure kernel:
func_config_kernel(){ # git_repository="$1"
  local git_repository
  local config_file buildtype options cmd
  git_repository="$1"

  ## copy .config file
  config_file="../kernel_config/config/config${M_TYPE}"
  cmd="cp -f ${config_file} ${git_repository}/.config"; echo "${cmd}"
  eval "${cmd}"

  ## BUILD THE CONFIGURATION:
  ## make ARCH=<target> CROSS_COMPILE=<target-triplet> [-j $(nproc)] buildtype
  ## - set options
  options="${ARCH} ${CROSS_COMPILE}"
  ## - select buildtype
  buildtype="olddefconfig"

  ## make with buildtype for generate new kernel
  echo "Start kernel build: ${KERNEL_VERSION}${M_TYPE} with ${buildtype}"
  echo "Options: ${options}"

  ## --------------------------
  cd "${git_repository}" || exit 1

  ## make with config buildtype
  cmd="make ${options} ${buildtype}"; echo "${cmd}"
  eval "${cmd}"

  cd "${SCRIPT_PATH}" || exit 1
  ## --------------------------
}

## -------------------------------------------------------------------------- ##
## MAIN:
## -------------------------------------------------------------------------- ##
## change to build directory
func_change_to_dir "${BUILD_DIR}"

## select the system architecture (./init) and set the corresponding values
func_set_system_architecture

## build the new kernel configuration
func_config_kernel "${GIT_REPOSITORY_NAME}"

## -------------------------------------------------------------------------- ##
## pause:
func_pause

## ########################################################################## ##
exit 0
