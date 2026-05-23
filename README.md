---
defaults: github-markdown
toc: false
---
<!-- *********************************************************************** -->
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

> [!NOTE]
> to get information about the available Debian kernels use
> `sudo apt-get update` and subsequently `apt list linux-image-*`

#### briefly:
- see [readme: about][]
- see [readme: content][]
- see [readme: usage][]

#### links:
- home page of [kernel.org][kernel]
- home page of [aufs][]

#### license:
- *GNU GENERAL PUBLIC LICENSE* [[text]](LICENSE)

<!-- *********************************************************************** -->
[readme: about]: doc/readme-matrixxx.md
[readme: content]: doc/readme-content.md
[readme: usage]: doc/readme-usage.md

[kernel]: https://kernel.org/
[aufs]: https://aufs.sourceforge.net/

********************************************************************************
> [!WARNING]
> **DISCLAIMER:** THIS IS EXPERIMENTAL SOFTWARE. USE AT YOUR OWN RISK. THE
> AUTHOR CAN NOT BE HELD LIABLE UNDER ANY CIRCUMSTANCES FOR DAMAGE TO HARDWARE
> OR SOFTWARE, LOST DATA, OR OTHER DIRECT OR INDIRECT DAMAGE RESULTING FROM THE
> USE OF THIS SOFTWARE.
> YOU ARE RESPONSIBLE FOR YOUR OWN COMPLIANCE WITH ALL APPLICABLE LAWS.

********************************************************************************
> [!NOTE]
> All markdown files contain a `pandoc` specific extension:
> **yaml_metadata_block**. This block is displayed as a table by GitHub,
> but is useful (for me) for checking the appearance.

> [!NOTE]
> Regarding external links:
> This description may contain links to external websites operated by third
> parties, over which I have no control. Therefore, I cannot be held responsible
> for the content of these external websites. The sole responsibility for the
> content of these linked pages lies with the respective provider or operator.

********************************************************************************
