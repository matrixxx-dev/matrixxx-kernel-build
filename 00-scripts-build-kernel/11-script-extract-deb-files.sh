#!/bin/bash

## ########################################################################## ##
##
## extract deb files
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
## Extract deb packages to 'data'
func_dpkg_extract_to_data() # dir_name="$1"
{
  ## declarations
  local dir_name output info prefix info_file file_ext file_list file
  dir_name="$1"
  output="./data"

  info="info"
  prefix="UPDATE-"
  info_file="${output}/${info}/${prefix}${dir_name}.txt"

  file_ext="deb"
  file_list=$(find ./ -type f -name \*."${file_ext}" -exec basename {} ';')

  if [ -z "${file_list}" ]
  then
    echo "  ... contains no debian package"
    return 1
  else
    ## check if output exist ...
    [ -d "${output}" ] && sudo rm -rf "${output}"
    [ -d "${output}" ] || sudo mkdir -p "${output}"/"${info}"
    sudo sh -c "echo 'CONTENT:' > ${info_file}"

    for file in ${file_list}; do
      echo "Extracted file: ${file}"
      sudo sh -c "echo ' '${file} >> ${info_file}"
      sudo dpkg -x ./"${file}" "${output}"
    done

    func_UsrMerge "${output}"

    sudo sh -c "echo 'DIRECTORIES:' >> ${info_file}"
    file_list="$(ls "${output}")"
    for file in ${file_list}; do
      sudo sh -c "echo ' '${file} >> ${info_file}"
    done
  fi
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
## change info file names - remove "UPDATE-"
func_change_info_file_names(){  # dir="$1"
  local dir start_path prefix list name new_name
  dir="$1"
  start_path="${PWD}"
  ## ----------------------------- ##
  cd "${dir}"/data/info || return 1
  prefix="UPDATE-"
  readarray -t list <<< "$(ls .)"

  for name in "${list[@]}"; do
    new_name=${name//${prefix}/}
    if [ ! "./${name}" = "./${new_name}" ]; then
      sudo mv ./"${name}" ./"${new_name}"
    fi
  done
  cd "${start_path}" || return 1
  ## ----------------------------- ##
}

## -------------------------------------------------------------------------- ##
func_process(){ # dir="$1"; name="$2"
  local dir name
  dir="$1"; name="$2"

  if [ -d "${dir}/data" ]; then
    echo "${dir}/data does exist!!!"
  else
    ## -------------------- ##
    cd "${dir}" || exit 1
    ## extract *.deb files to_data
    func_dpkg_extract_to_data "${name}"

    ## change info file names (because we generate a squashfs image)
    func_change_info_file_names "${dir}"

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

## extract deb files
func_change_to_dir "${STORAGE_DIR}"
func_process "." "${RELEASE_TAG}${M_TYPE}"

## -------------------------------------------------------------------------- ##
## pause:
func_pause

## ########################################################################## ##
exit 0
