
# Maintainer: condexpr01(Vito Devlin) <condexpr01@outlook.com>
PACKAGER='condexpr01(Vito Devlin) <condexpr01@outlook.com>'
pkgname=zsh-config
pkgver=2026.01.20.1
pkgrel=1
pkgdesc='zsh&tmux configure'
arch=('any')
url='https://github.com/condexpr01/zsh-config'

license=('MIT')

#depends=()
#makedepends=('pandoc' 'gzip' 'tmux' 'zsh')

source=('readme.md'
		'LICENSE.txt'
		'.p10k.zsh'
		'.zshrc'
		'tmux.conf'
		'zshenv'
		'git+https://github.com/romkatv/powerlevel10k.git')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

prefix=${PREFIX:-/usr}

package() {
	if command -v pandoc 2>/dev/null >/dev/null ; then
		pandoc -s -t man "$srcdir/readme.md" -o "$srcdir/readme.1"
		gzip -9c "$srcdir/readme.1" > "$srcdir/${pkgname}.gz"
		install -Dm644 "$srcdir/${pkgname}.gz" "$pkgdir${prefix}/share/man/man1/${pkgname}.1.gz"
	else
		echo "Warning: no pandoc, won't install man doc"
	fi

	install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir${prefix}/share/license/${pkgname}/LICENSE.txt"

	# ZDOTDIR in zshenv: $prefix/share/zsh-config
	local config_home=$prefix/share/zsh-config

	# grep hardcoded zshenv path from zsh binary, or default to ${pkgdir}${PREFIX}/etc/zsh/zshenv
	local zshenvpath="$(strings $(which zsh) | grep -P "(/.*/etc.*/zshenv|/etc.*/zshenv)" | head --lines=1)"

	if [ -z "$zshenvpath" ];then
		zshenvpath="${pkgdir}${PREFIX}/etc/zsh/zshenv"
	else
		zshenvpath="${pkgdir}${PREFIX}${zshenvpath}"
	fi

	install -Dm644 "$srcdir/zshenv" "${zshenvpath}"

	install -Dm644 "$srcdir/.p10k.zsh" "$pkgdir$config_home/.p10k.zsh"
	install -Dm644 "$srcdir/.zshrc" "$pkgdir$config_home/.zshrc"

	install -Dm644 "$srcdir/tmux.conf" "$pkgdir$prefix/../etc/tmux/tmux.conf"

	install -dm755 "$pkgdir$config_home/powerlevel10k"
	mv "$srcdir/powerlevel10k/"* "$pkgdir$config_home/powerlevel10k/"
}

