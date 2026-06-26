# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit go-module

DESCRIPTION="Find secrets with Gitleaks 🔑"
HOMEPAGE="https://gitleaks.io"
SRC_URI="
https://api.github.com/repos/gitleaks/gitleaks/tarball/v8.30.1 -> gitleaks-8.30.1-83d9cd6.tar.gz
mirror://macaroni/gitleaks-8.30.1-mark-go-bundle-83d9cd6.tar.xz -> gitleaks-8.30.1-mark-go-bundle-83d9cd6.tar.xz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
BDEPEND=">=dev-lang/go-1.26.2
	
"

post_src_unpack() {
	mv gitleaks-gitleaks-* ${S}
}


src_compile() {
	local custom_ldflags=(
	"-X=github.com/zricethezav/gitleaks/v8/version.Version=${PV}"
)
go generate ./... || die "go generate failed"
go build -mod=mod \
	--ldflags "${custom_ldflags[*]}" \
	-v -x || die "compile failed"

}
src_install() {
	dobin gitleaks
	dodoc README.md
}



# vim: filetype=ebuild
