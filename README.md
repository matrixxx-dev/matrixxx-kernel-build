# matrixxx-kernel-build
- This repository is primarily a shell script collection to generate a special
  customized kernel for matrixxx (a D.I.Y linux live system)
  - scripts to handle the kernel git repsitory
  - scripts to handle the aufs (advanced multi layered unification filesystem)
    git repsitory as a kernel module
  - scripts to generate a customized kernel
    (included aufs & drivers to boot from USB stick)
- This creates the kernel itself and the associated libraries together
  with the associated 'aufs-tools'
- The results are x86 kernels in 32-bit and 64-bit versions

## briefly about the matrixxx project:
- see [readme: matrixxx.md](./doc/readme-matrixxx.md)

<!--
## briefly about the kernel-build process and usage:
- see [readme: kernel-build process](./doc/readme-process.md)
- see [readme: usage](./doc/readme-usage.md)
-->

#### links:
- home page of [kernel.org][kernel]
- home page of [aufs][]

<!-- *********************************************************************** -->
[kernel]: https://kernel.org/
[aufs]: https://aufs.sourceforge.net/

********************************************************************************
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
- 00-script-set-kernel-repository-default.sh
- 01-script-build-kernel--create_kernel_config_file.sh
- 02-script-build-kernel--transcription.sh
- 10-script-save-results.sh
- 11-script-extract-deb-files.sh
- 12-script-build-squashfs-image.sh
- config_init
- **[dir]** doc
  - contains additional readme files
- init
- P0-script-change-compiler.sh
- P0-script-check-compiler.sh
- P1-script-cleaning-target.sh
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
