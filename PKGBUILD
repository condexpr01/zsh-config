
# Maintainer: condexpr01(Vito Devlin) <condexpr01@outlook.com>
PACKAGER='condexpr01(Vito Devlin) <condexpr01@outlook.com>'
pkgname=zsh-config
pkgver=2026.01.20.1
pkgrel=1
pkgdesc='zsh&tmux configure'
arch=('any')
url='https://github.com/condexpr01/zsh-config'

license=('unlicense')

#depends=()
#makedepends=('pandoc' 'gzip' 'tmux' 'zsh')

source=('readme.md'
		'LICENSE.txt'
		'.p10k.zsh'
		'.zshrc'
		'tmux.conf'
		'zshenv'
		'git+ssh://git@github.com/romkatv/powerlevel10k.git')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

prefix=${PREFIX:-/usr}

package() {
	pandoc -s -t man "$srcdir/readme.md" -o "$srcdir/readme.1"
	gzip -9c "$srcdir/readme.1" > "$srcdir/${pkgname}.gz"

	install -Dm644 "$srcdir/${pkgname}.gz" "$pkgdir${prefix}/share/man/man1/${pkgname}.1.gz"
	install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir${prefix}/share/license/${pkgname}/LICENSE.txt"

	# ZDOTDIR in zshenv: $prefix/share/zsh-config
	local config_home=$prefix/share/zsh-config

	# zshenv
	install -Dm644 "$srcdir/zshenv" "${pkgdir}${PREFIX}/etc/zsh/zshenv"

	install -Dm644 "$srcdir/.p10k.zsh" "$pkgdir$config_home/.p10k.zsh"
	install -Dm644 "$srcdir/.zshrc" "$pkgdir$config_home/.zshrc"
	install -Dm644 "$srcdir/tmux.conf" "$pkgdir$config_home/tmux/tmux.conf"

	install -dm755 "$pkgdir$config_home/powerlevel10k"
	cp -r "$srcdir/powerlevel10k/"* "$pkgdir$config_home/powerlevel10k/"
}

