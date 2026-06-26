# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit go-module

DESCRIPTION="A Go implementation of copyfail (CVE-2026-31431)"
HOMEPAGE="https://github.com/badsectorlabs/copyfail-go"
SRC_URI="
https://api.github.com/repos/badsectorlabs/copyfail-go/tarball/1.2.0 -> copyfail-go-1.2.0-9f4e493.tar.gz
mirror://macaroni/copyfail-go-1.2.0-mark-go-bundle-9f4e493.tar.xz -> copyfail-go-1.2.0-mark-go-bundle-9f4e493.tar.xz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
BDEPEND=">=dev-lang/go-1.26.2
	
"

post_src_unpack() {
	mv badsectorlabs-copyfail-go-* ${S}
}


src_compile() {
	go build -mod=mod . || die "compile failed"
}
src_install() {
	newbin copyfail copyfail-go
	dodoc README.md
}



# vim: filetype=ebuild
