#!/bin/bash

## ########################################################################## ##
##
## set compiler version
##
## ########################################################################## ##

#VERSION="11"
#VERSION="12"
#VERSION="13"
#VERSION="14"
#VERSION="15"
#VERSION="16"

## -------------------------------------------------------------------------- ##
## FUNCTIONS:
## -------------------------------------------------------------------------- ##
func_set_selected_compiler(){ # version="$1"
  local compiler required_compiler

  required_compiler=(
  "gcc" # GNU C compiler
  "g++" # GNU C++ compiler
  )

  for compiler in "${required_compiler[@]}"
  do
    func_set_compiler "${version}" "${compiler}"
    func_set_compiler "${version}" "x86_64-linux-gnu-${compiler}"
    func_set_compiler "${version}" "i686-linux-gnu-${compiler}"
  done
}

func_set_compiler(){ # version="$1"; compiler="$2"
  local version compiler
  version="$1"; compiler="$2"

  echo "## ----------------------------------------------------------------- ##"
  compiler=$(type -p "${compiler}")
  echo "- compiler: ${compiler}"
  [ -f "${compiler}-${version}" ] || { \
    echo "-> compiler version: ${version} does not exist!!!";
    return 1;
  }
  sudo rm -f "${compiler}"
  sudo ln -s "${compiler}-${version}" "${compiler}"
  file "${compiler}"
}

## -------------------------------------------------------------------------- ##
## MAIN:
## -------------------------------------------------------------------------- ##
if [ -z "${VERSION}" ]; then
  echo "no compiler version is selected!"
else
  func_set_selected_compiler "${VERSION}"
fi

## -------------------------------------------------------------------------- ##
## pause:
echo "Press enter to continue..."; read -r

## ########################################################################## ##
exit 0
