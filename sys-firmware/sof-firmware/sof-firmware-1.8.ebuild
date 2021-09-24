# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Sound Open Firmware (SOF) binary files"

HOMEPAGE="https://www.sofproject.org https://github.com/thesofproject/sof https://github.com/thesofproject/sof-bin"
SRC_URI="https://github.com/thesofproject/sof-bin/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

S=${WORKDIR}/sof-bin-${PV}

src_install() {
	insinto /lib/firmware/intel

	doins -r v${PV}.x/sof
	doins -r v${PV}.x/sof-v${PV}
	doins -r v${PV}.x/sof-tplg
	doins -r v${PV}.x/sof-tplg-v${PV}

	for binary in sof-ctl sof-logger sof-probes; do
		dobin v${PV}.x/tools-v${PV}/${binary}
	done
}