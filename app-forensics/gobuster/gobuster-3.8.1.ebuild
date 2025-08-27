# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit go-module

DESCRIPTION="Directory/File, DNS and VHost busting tool written in Go"
HOMEPAGE="https://github.com/OJ/gobuster"
SRC_URI="
https://api.github.com/repos/OJ/gobuster/tarball/v3.8.1 -> gobuster-3.8.1-041578e.tar.gz
mirror://macaroni/gobuster-3.8.1-mark-go-bundle-041578e.tar.xz -> gobuster-3.8.1-mark-go-bundle-041578e.tar.xz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"
BDEPEND=">=dev-lang/go-1.24
	
"

post_src_unpack() {
	mv OJ-gobuster-* ${S}
}


src_compile() {
	go build -mod=mod . || die "compile failed"
}
src_install() {
	dobin gobuster
	dodoc README.md
}



# vim: filetype=ebuild
