#!/bin/bash

## ########################################################################## ##
##
## set default for aufs kernel module repository
##
## ########################################################################## ##
## includes:
. ../lib/func_git-handling
. ./init

## defines:
CALLEE="$1"

## -------------------------------------------------------------------------- ##
## MAIN:
## -------------------------------------------------------------------------- ##
## change to build directory
func_change_to_dir "${BUILD_DIR}"

## set local git repository to default
cd "${GIT_REPOSITORY_NAME}" || exit 1
func_git_fetch
func_git_switch_to_branch "${RELEASE_BRANCH}"

## -------------------------------------------------------------------------- ##
## pause:
func_pause
## ########################################################################## ##
exit 0
