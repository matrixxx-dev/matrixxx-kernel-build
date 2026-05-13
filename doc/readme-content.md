---
defaults: github-markdown
toc: false
---
<!-- *********************************************************************** -->

### Content of matrixxx-kernel-build.git:
- **[dir]**
  **[00-scripts-build-kernel](#build-kernel)**
  - contains the scripts for kernel build
- **[dir]**
  **[01-scripts-build-module-aufs](#build-module-aufs)**
  - contains the scripts for module aufs patches of corresponding kernel
- **[dir]**
  **[02-scripts-build-tools-aufs-util](#build-tools-aufs-util)**
  - contains the scripts for aufs-util build (tools)
- **[dir]** doc
  - contains additional readme files
- **[dir]** lib
  - contains some libraries of common script functions
- LICENSE
  - *GNU GENERAL PUBLIC LICENSE* [[text]](LICENSE)
- README.md
  - *briefly description about the matrixxx-kernel-build.git* (this file)

********************************************************************************
#### Content of '00-scripts-build-kernel': <a name="build-kernel"/>
- 00-script-get-kernel-repository.sh
- 00-script-kernel-repository-fetch.sh
- 00-script-kernel-repository-set-local-branch.sh
- 01-script-build-kernel--create_kernel_config_file.sh
- 02-script-build-kernel--transcription.sh
- 10-script-save-results.sh
- 11-script-extract-deb-files.sh
- 12-script-build-squashfs-image.sh
- config_init
- init
- P0-script-check-compiler.sh
- P1-script-change-compiler.sh
- P2-script-cleaning-target.sh
- script-build-kernel.sh

********************************************************************************
#### Content of '01-scripts-build-module-aufs': <a name="build-module-aufs"/>
- 00-script-get-aufs-repository.sh
- 00-script-set-aufs-repository-default.sh
- A1-kernel-patch.sh
- init

********************************************************************************
#### Content of '02-scripts-build-tools-aufs-util': <a name="build-tools-aufs-util"/>
- 00-script-get-aufs-util-repository.sh
- 00-script-set-aufs-util-repository-default.sh
- A1-build-aufs-util.sh
- A2-clean-repository.sh
- init

