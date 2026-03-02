
# Maintainer: condexpr01(Vito Devlin) <condexpr01@outlook.com>
PACKAGER='condexpr01(Vito Devlin) <condexpr01@outlook.com>'
pkgname=zsh-config
pkgver=2026.03.02.1
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

	######################

	# ZDOTDIR in zshenv: $prefix/share/zsh-config
	local config_home=$prefix/share/zsh-config

	install -Dm644 "$srcdir/.p10k.zsh" "$pkgdir$config_home/.p10k.zsh"
	install -Dm644 "$srcdir/.zshrc" "$pkgdir$config_home/.zshrc"

	install -dm755 "$pkgdir$config_home/powerlevel10k"
	mv "$srcdir/powerlevel10k/"* "$pkgdir$config_home/powerlevel10k/"

	######################

	# not ${prefix}, avoid /usr/etc
	local etcdir="${pkgdir}${PREFIX}/etc"

	local zshenv_hardcode="$(   strings $(which zsh)  | grep -oP "/etc[^:;]*/zshenv"    | head --lines=1)"
	local tmux_conf_hardcode="$(strings $(which tmux) | grep -oP "/etc[^:;]*/tmux.conf" | head --lines=1)"

	if [ -z "${zshenv_hardcode}" ];then
		#predict zshenv path
		install -Dm644 "$srcdir/zshenv" "${etcdir}/zsh/zshenv"
	else
		#zshenv_hardcode
		install -Dm644 "$srcdir/zshenv" "${pkgdir}${PREFIX}/${zshenv_hardcode}"
	fi

	if [ -z "${tmux_conf_hardcode}" ];then
		#predict tmux.conf path
		install -Dm644 "$srcdir/tmux.conf" "${etcdir}/tmux.conf"
	else
		#tmux_conf_hardcode
		install -Dm644 "$srcdir/tmux.conf" "${pkgdir}${PREFIX}/${tmux_conf_hardcode}"
	fi

}





