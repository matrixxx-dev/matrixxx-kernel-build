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
  local git_repository
  local buildtype options cpu_jobs cmd
  git_repository="$1"

  ## BUILD THE KERNEL:
  ## make ARCH=<target> CROSS_COMPILE=<target-triplet> -j $(nproc) buildtype
  ## - set options
  options="${ARCH} ${CROSS_COMPILE}"
  [ "${DEBUG}" = "true" ] && options="V=1 ${ARCH} ${CROSS_COMPILE}"

  ## - set cpu_jobs
   cpu_jobs="--output-sync -j $(nproc)"
  [ "${DEBUG}" = "true" ] && cpu_jobs="-j 1"

  ## - select buildtype
  #buildtype="deb-pkg"      ## Build both source and binary deb kernel packages
  buildtype="bindeb-pkg"   ## Build only the binary kernel deb package

  ## make with buildtype for generate new kernel
  echo "Start kernel build: ${KERNEL_VERSION}${M_TYPE} with ${buildtype}"
  echo "Options: ${options}"
  echo "Processor settings: ${cpu_jobs}"

  ## --------------------------
  cd "${git_repository}" || exit 1

  ## make with deb kernel buildtype
  cmd="make ${options} ${cpu_jobs} ${buildtype}"; echo "${cmd}"
  eval "${cmd}"

  cd "${SCRIPT_PATH}" || exit 1
  ## --------------------------
}

## -------------------------------------------------------------------------- ##
## MAIN:
## -------------------------------------------------------------------------- ##

## -----------------------
## time measurement: start
main_start=$(date +%s)
## -----------------------
## change to build directory
func_change_to_dir "${BUILD_DIR}"

## select the system architecture (./init) and set the corresponding values
func_set_system_architecture

## build the new kernel
func_build_process "${GIT_REPOSITORY_NAME}"

## -----------------------
## time measurement: end
main_end=$(date +%s); period=$((main_end - main_start))
## -----------------------
echo "Processing - elapsed time: ${period} seconds"

## -------------------------------------------------------------------------- ##
## pause:
func_pause

## ########################################################################## ##
exit 0
