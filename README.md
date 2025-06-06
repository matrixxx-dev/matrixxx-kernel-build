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

## briefly about the kernel-build process and usage:
- see [readme: kernel-build process](./doc/readme-process.md)
- see [readme: usage](./doc/readme-usage.md)

#### links:
- home page of [kernel.org][kernel]
- home page of [aufs][]

<!-- *********************************************************************** -->
[kernel]: https://kernel.org/
[aufs]: https://aufs.sourceforge.net/
