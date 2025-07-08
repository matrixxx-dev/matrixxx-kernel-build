#!/bin/bash

## ########################################################################## ##
##
## build a squashfs kernel image
##
## ########################################################################## ##
## includes:
. ./init
. ../lib/func_kernel-build-handling
. ../lib/func_mk-squasfs-image-handling

## defines:
CALLEE="$1"

## -------------------------------------------------------------------------- ##
## FUNCTIONS:
## -------------------------------------------------------------------------- ##
func_process(){ # dir="$1"
  local dir
  dir="$1"

  if [ -d "${dir}/data" ]; then
    ## -------------------- ##
    cd "${dir}" || exit 1
    ## generate a squashfs image
    cd "${dir}" || exit 1
    image="LAYER${LAYER_NO}"
    if [ -f "${image}" ]; then
      echo "-> ${dir}/${image} does exist"
    else
      echo "- mk squashfs image: ${dir}/${image}"
      func_mk_squashfs_image "./data" ./"${image}"
    fi

    cd "${SCRIPT_PATH}" || exit 1
    ## -------------------- ##
  fi
}

## -------------------------------------------------------------------------- ##
## MAIN:
## -------------------------------------------------------------------------- ##
## change to build directory
func_change_to_dir "${BUILD_DIR}"

## define the STORAGE_DIR
func_set_system_architecture
STORAGE_DIR="${RELEASE_TAG}${M_TYPE}"

## build a squashfs kernel image
func_change_to_dir "${STORAGE_DIR}"
func_process "." "${RELEASE_TAG}${M_TYPE}"

## -------------------------------------------------------------------------- ##
## pause:
func_pause

## ########################################################################## ##
exit 0
