#!/bin/bash

## ########################################################################## ##
##
## Build aufs util
##
## ########################################################################## ##
## includes:
. ./init
. ../lib/func_kernel-build-handling

## -------------------------------------------------------------------------- ##
## FUNCTIONS:
## -------------------------------------------------------------------------- ##
func_build_aufs_util(){ # linuxsrc="$1"
  local linuxsrc data_dir
  linuxsrc="$1"

  ## set local git repository to default
  cd "${GIT_REPOSITORY_NAME}" || exit 1
  linuxsrc="../${linuxsrc}/usr/include"
  #echo "STORAGE_DIR: ${linuxsrc}"
  data_dir="data${M_TYPE}"

  CPPFLAGS="-I ${linuxsrc}"
  HOSTCC="$(uname -m)-linux-gnu-gcc"
  CC="${TARGET_TUPLES}-gcc"
  export CPPFLAGS HOSTCC CC

  make all
  [ -d "../${data_dir}" ] || mkdir -p "../${data_dir}"
  sudo make DESTDIR="../${data_dir}" install
  func_UsrMerge "../${data_dir}"
  if [ -n "${M_TYPE}" ]; then
    sudo mv -f "./${data_dir}/usr/lib" "./${data_dir}/usr/lib64"
  fi
  sudo cp -ax "./${data_dir}/." "../${data_dir}"
  sudo rm -rf "${data_dir}"
}

func_UsrMerge(){ # working_dir="$1"
  local dir_array working_dir old_dir new_dir
  dir_array=("bin" "sbin" "lib" "lib32" "lib64" "libexec" "libx32")

  working_dir="$1"
  if [ -d "${working_dir}" ]; then
    for element in "${dir_array[@]}"
    do
      old_dir="${working_dir}/${element}"
      if [ -d "${old_dir}" ]; then
        # Make a new directory (skip if already exists)
        new_dir="${working_dir}/usr/${element}"
        [ -d "${new_dir}" ] || sudo mkdir -p "${new_dir}"

        # Copy all files to the new directory
        # (-afr : Keep attributes, Force overwrite, Recursive copy)
        sudo cp -afr "${old_dir}"/. "${new_dir}"/

        # Remove old directory
        sudo rm -rf "${old_dir}"
      fi
    done
  fi
}

## -------------------------------------------------------------------------- ##
## MAIN:
## -------------------------------------------------------------------------- ##
## change to build directory
func_change_to_dir "${BUILD_DIR}"

## define the STORAGE_DIR
func_set_system_architecture
STORAGE_DIR="../build-kernel/${RELEASE_TAG}${M_TYPE}/data"
if [ -d "${STORAGE_DIR}" ]; then
  echo "STORAGE_DIR: ${STORAGE_DIR}"
  func_build_aufs_util "${STORAGE_DIR}"
else
  echo "STORAGE_DIR: ${STORAGE_DIR} does not exist!"
fi

## -------------------------------------------------------------------------- ##
## pause:
echo "Press enter to continue..."; read -r

## ########################################################################## ##
exit 0
