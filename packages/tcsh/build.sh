TERMUX_PKG_HOMEPAGE=https://www.tcsh.org
TERMUX_PKG_DESCRIPTION="TENEX C Shell, an enhanced version of Berkeley csh"
TERMUX_PKG_LICENSE="BSD 3-Clause"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=6.24.06
TERMUX_PKG_SRCURL=https://github.com/tcsh-org/tcsh/archive/TCSH${TERMUX_PKG_VERSION//./_}.tar.gz
TERMUX_PKG_SHA256=4c87aa8e9ab9f3c534153b4ceabaaecc16f25c6f27bbe71399f75af8178b719d
TERMUX_PKG_BUILD_DEPENDS="libcrypt, ncurses"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--enable-nls --disable-nls-catalogs"
