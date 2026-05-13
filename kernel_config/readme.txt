cp -f ../kernel_config/config/config-64 linux.git/.config
Start kernel build: -64 with olddefconfig
Options: ARCH="x86_64" CROSS_COMPILE=x86_64-linux-gnu-
make ARCH="x86_64" CROSS_COMPILE=x86_64-linux-gnu- olddefconfig
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  LEX     scripts/kconfig/lexer.lex.c
  YACC    scripts/kconfig/parser.tab.[ch]
  HOSTCC  scripts/kconfig/lexer.lex.o
  HOSTCC  scripts/kconfig/menu.o
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTCC  scripts/kconfig/util.o
  HOSTLD  scripts/kconfig/conf
.config:904:warning: symbol value '0' invalid for BASE_SMALL
.config:6688:warning: symbol value 'm' invalid for FB_BACKLIGHT
.config:8357:warning: symbol value 'm' invalid for HYPERV
.config:10330:warning: symbol value 'm' invalid for CRYPTO_LIB_CURVE25519_GENERIC
.config:10335:warning: symbol value 'm' invalid for CRYPTO_LIB_POLY1305_GENERIC
#
# configuration written to .config
#
Press enter to continue...


********************************************************************************
/home/xxx/.gitconfig
  email = info@www.matrixxx.dev   <- ändern
Hinweis auf eingerichtetes GIT

********************************************************************************
icht erfüllte Bauabhängigkeiten: libdw-dev:native
