#!/bin/bash

## ########################################################################## ##
##
## Patch Kernel - copy module to current chosen kernel build directory
##
## ########################################################################## ##
## includes:
. ./init

## -------------------------------------------------------------------------- ##
## FUNCTIONS:
## -------------------------------------------------------------------------- ##
func_install_patches(){ # version="$1"; repository_path="$2"
  local version repository_path patch_file patchfile_list
  version="$1"; repository_path="$2"

  ## Install the required patches:
  ##  - apply ./aufs[]-kbuild.patch to your kernel source files.
  ##  - apply ./aufs[]-base.patch too.
  ##  - apply ./aufs[]-mmap.patch too.
  ##  - apply ./aufs[]-standalone.patch too,
  ##          if you have a plan to set CONFIG_AUFS_FS=m.
  ##          otherwise you don't need ./aufs[]-standalone.patch.
  patchfile_list=(
  kbuild.patch
  base.patch
  mmap.patch
  standalone.patch        ## for CONFIG_AUFS_FS = m
  )

  ## copy and apply all patches
  for patch_file in "${patchfile_list[@]}"; do
    patch_file="${repository_path}/aufs${version}-${patch_file}"
    if [ -f "${patch_file}" ]; then
      #echo "${patch_file} exists"
      patch -p1 < "${patch_file}"                           ## Set patch
    else
      echo "${patch_file} file does not exist"
    fi
  done

}

## -------------------------------------------------------------------------- ##
func_copy_files(){ # repository_path="$1"
  local repository_path
  repository_path="$1"

  ## Copy the required files (see README)
  ## - copy ./{Documentation,fs,include/uapi/linux/aufs_type.h}
  ##        files to the kernel source tree
  cp -rf "${repository_path}"/Documentation/* ./Documentation
  cp -rf "${repository_path}"/fs/* ./fs
  cp -f "${repository_path}"/include/uapi/linux/aufs_type.h \
        ./include/uapi/linux/aufs_type.h
}

## -------------------------------------------------------------------------- ##
## MAIN:
## -------------------------------------------------------------------------- ##
## change to build directory
func_change_to_dir "${KERNEL_BUILD_PATH}"

## patch & copy
func_install_patches "${BASE_MODUL_VERSION}" "${REPOSITORY_PATH}"
func_copy_files "${REPOSITORY_PATH}"

## -------------------------------------------------------------------------- ##
## pause:
echo "Press enter to continue..."; read -r

## ########################################################################## ##
exit 0
