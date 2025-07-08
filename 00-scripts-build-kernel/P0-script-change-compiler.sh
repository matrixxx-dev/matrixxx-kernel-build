#!/bin/bash

## ########################################################################## ##
##
## set compiler version
##
## ########################################################################## ##

#VERSION="11"
VERSION="12"
#VERSION="13"
#VERSION="14"

## -------------------------------------------------------------------------- ##
## FUNCTIONS:
## -------------------------------------------------------------------------- ##
func_set_selected_compiler(){
  local compiler required_compiler

  required_compiler=(
  "gcc" # GNU C compiler
  "g++" # GNU C++ compiler
  )

  for compiler in "${required_compiler[@]}"
  do
    func_set_compiler "${compiler}"
    func_set_compiler "x86_64-linux-gnu-${compiler}"
    func_set_compiler "i686-linux-gnu-${compiler}"
  done
}

func_set_compiler(){ # compiler="$1"
  local compiler
  compiler="$1"

  echo "## ----------------------------------------------------------------- ##"
  compiler=$(type -p "${compiler}")
  echo "- compiler: ${compiler}"
  [ -f "${compiler}-${VERSION}" ] || { \
    echo "-> compiler version: ${VERSION} does not exist!!!";
    return 1;
  }
  sudo rm -f "${compiler}"
  sudo ln -s "${compiler}-${VERSION}" "${compiler}"
  file "${compiler}"
}

## -------------------------------------------------------------------------- ##
## MAIN:
## -------------------------------------------------------------------------- ##
func_set_selected_compiler

## -------------------------------------------------------------------------- ##
## pause:
echo "Press enter to continue..."; read -r

## ########################################################################## ##
exit 0
