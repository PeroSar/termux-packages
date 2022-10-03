TERMUX_PKG_HOMEPAGE="https://github.com/wfxr/csview"
TERMUX_PKG_DESCRIPTION="Pretty-printing CSV/TSV/xSV on terminal"
TERMUX_PKG_LICENSE="MIT, Apache-2.0"
TERMUX_PKG_LICENSE_FILE="LICENSE-MIT"
TERMUX_PKG_MAINTAINER="@flosnvjx"
TERMUX_PKG_VERSION="1.2.1"
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SRCURL="$TERMUX_PKG_HOMEPAGE/archive/v$TERMUX_PKG_VERSION.tar.gz"
TERMUX_PKG_SHA256=1b2d399b00c0bf55b1029360c941ac8c81b04e0838d754fa01aa5dca07d7b761

TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make() {
	termux_setup_rust
	cargo build --jobs $TERMUX_MAKE_PROCESSES --target $CARGO_TARGET_NAME --release --locked
}

termux_step_make_install() {
	install -Dm700 -t $TERMUX_PREFIX/bin target/${CARGO_TARGET_NAME}/release/csview
	install -Dm600 -t $TERMUX_PREFIX/share/doc/$TERMUX_PKG_NAME README.*
	install -Dm600 "completions/fish/csview.fish" "$TERMUX_PREFIX/share/fish/vendor_completions.d/csview.fish"
	install -Dm600 "completions/zsh/_csview" "$TERMUX_PREFIX/share/zsh/site-functions/_csview"
	install -Dm600 "completions/bash/csview.bash" "$TERMUX_PREFIX/share/bash-completion/completions/csview"

	# https://github.com/elves/elvish/issues/1564#issuecomment-1166333636
	install -Dm600 "completions/elvish/csview.elv" -t $TERMUX_PREFIX/share/elvish/lib
}