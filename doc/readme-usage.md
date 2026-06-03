---
defaults: github-markdown
toc: false
---
<!-- *********************************************************************** -->
# kernel-build process
### brief description of the work steps
- **manually:** adapt the config_init file
  - system architecture selection:
    - SYSTEM_ARCHITECTURE=${SYSTEM_x86_64}
    - SYSTEM_ARCHITECTURE=${SYSTEM_i686}

#### '00-scripts-build-kernel': <a name="build-kernel"/>
- **execute:** 00-script-get-kernel-repository.sh
  - will only be executed if the kernel repository in this environment has
     not yet been cloned (creates the `build-kernel` directory with the
     kernel repository `linux.git`)
- **execute:** 00-script-kernel-repository-fetch.sh
  - performs a fetch on the kernel repository so that the latest
    data is available
- **manually:** adapt the `config_init` file with the desired `RELEASE_TAG` 
    and check `SYSTEM_ARCHITECTURE`
  - note: retrieve all tags that match the specified kernel release pattern to
    find the desired release tag
    - for example `git tag -l "v6.7.*"'`
- **execute:** 00-script-kernel-repository-set-local-branch.sh
  - create (if necessary) and then switch to a new local branch which name
    based on the selected kernel release tag
- **manually:** process [01-scripts-build-module-aufs](#build-module-aufs)
  - this patch the kernel repository with the aufs module
- **manually:** `git add .` and `git commit -m "include aufs patch"` of the
  local kernel repository branch
- **execute:** 01-script-build-kernel--create_kernel_config_file.sh
  - generates a suitable config file from an existing one
- **execute:** 02-script-build-kernel--transcription.sh
  - generates the actual kernel build (transcription with the `script`
    command)
  - after this you will find the result files directly in the `build-kernel'
    directory
- **execute:** 10-script-save-results.sh
  - copy all result files in corresponding kernel and architecture specific
    directory
- **execute:** 11-script-extract-deb-files.sh
  - unpack the deb files to a data directory
```
linux-headers-*.deb
linux-image-*.deb
linux-libc-dev_*.deb
```
- **manually:** process [02-scripts-build-tools-aufs-util](#build-tools-aufs-util)
  - this generate the aufs-utils which sould be integrated in the data directory
- **execute:** 12-script-build-squashfs-image.sh
  - generate a squashfs image from data directory (LAYER0)

********************************************************************************
#### '01-scripts-build-module-aufs': <a name="build-module-aufs"/>
- **execute:** 00-script-get-aufs-repository.sh
  -  will only be executed if the aufs repository in this environment has
     not yet been cloned (creates the 'build-module-aufs' directory)
- **manually:** adapt the init file with the desired 'BASE_KERNEL_VERSION'
  - please read the home page of [aufs](https://aufs.sourceforge.net/)
- **execute:** 00-script-set-aufs-repository-default.sh
  - performs a fetch on the kernel repository so that the latest
    data is available
  - switch to the selected branch
- **execute:** A1-kernel-patch.sh
  - patch the the kernel repository with the corresponding aufs module

********************************************************************************
#### '02-scripts-build-tools-aufs-util': <a name="build-tools-aufs-util"/>
- **execute:** 00-script-get-aufs-util-repository.sh
  -  will only be executed if the aufs repository in this environment has
     not yet been cloned (creates the 'build-tools-aufs' directory)
- **manually:** adapt the init file with the desired 'BASE_KERNEL_VERSION'
  - please read the README file in repository for correct setting
- **execute:** 00-script-set-aufs-util-repository-default.sh
  - performs a fetch on the kernel repository so that the latest
    data is available
  - switch to the selected branch
- **execute:** A1-build-aufs-util.sh
  - generate the aufs-utils files
  - install the files in a corresponding data directory
- **manually:** copy the resulting directory into the data directory of
  kernel build
- **execute:** A2-clean-repository.sh
  - erase all result files from repository
