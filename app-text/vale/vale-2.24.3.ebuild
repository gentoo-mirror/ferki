# Copyright 2021-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="A syntax-aware linter for prose built with speed and extensibility in mind"
HOMEPAGE="https://vale.sh/docs/"

SRC_URI="
	https://github.com/errata-ai/vale/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/ferki/${PN}/releases/download/v${PV}-gentoo-deps/${P}-gentoo-deps.tar.xz
"

LICENSE="Apache-2.0 BSD BSD-2 MIT public-domain"
SLOT="0"
KEYWORDS="~amd64"
IUSE="asciidoc rst xml"

RESTRICT="test"

RDEPEND="
	asciidoc? ( dev-ruby/asciidoctor )
	rst? ( dev-python/docutils )
	xml? ( dev-libs/libxslt )
"

src_prepare() {
	sed -i "s/\$(LAST_TAG)/v${PV}/" Makefile || die 'sed failed'
	default
}

src_compile() {
	emake build os=linux
}

src_install() {
	dobin bin/vale
	default_src_install
}
