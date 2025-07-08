#!/bin/bash

## ########################################################################## ##
##
## check compiler version
##
## ########################################################################## ##

## -------------------------------------------------------------------------- ##
## FUNCTIONS:
## -------------------------------------------------------------------------- ##
func_check_selected_compiler(){
  local compiler required_compiler

  required_compiler=(
  "gcc" # GNU C compiler
  "g++" # GNU C++ compiler
  )

  for compiler in "${required_compiler[@]}"
  do
    func_check_compiler "${compiler}"
    func_check_compiler "x86_64-linux-gnu-${compiler}"
    func_check_compiler "i686-linux-gnu-${compiler}"
  done
}

func_check_compiler(){ # compiler="$1"
  local compiler
  compiler="$1"

  echo "## ----------------------------------------------------------------- ##"
  compiler=$(type -p "${compiler}")
  echo "- check compiler: ${compiler}"
  file "${compiler}"
}

## -------------------------------------------------------------------------- ##
## MAIN:
## -------------------------------------------------------------------------- ##
func_check_selected_compiler

## -------------------------------------------------------------------------- ##
## pause:
echo "Press enter to continue..."; read -r

## ########################################################################## ##
exit 0
