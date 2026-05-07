# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit go-module

DESCRIPTION="Vulnerability scanner written in Go which uses the data provided by https://osv.dev"
HOMEPAGE="https://google.github.io/osv-scanner/"
SRC_URI="
https://api.github.com/repos/google/osv-scanner/tarball/v2.3.6 -> osv-scanner-2.3.6-c48ab01.tar.gz
mirror://macaroni/osv-scanner-2.3.6-mark-go-bundle-c48ab01.tar.xz -> osv-scanner-2.3.6-mark-go-bundle-c48ab01.tar.xz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"
BDEPEND=">=dev-lang/go-1.26.2
	
"

post_src_unpack() {
	mv google-osv-scanner-* ${S}
}


src_compile() {go build -mod=mod ./cmd/osv-scanner || die "compile failed"

}
src_install() {
	dobin osv-scanner
	dodoc README.md
}



# vim: filetype=ebuild
