# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rpm

DESCRIPTION="Tools for Microsoft(R) SQL Server(R)"
SRC_URI="https://packages.microsoft.com/rhel/8/prod/${PN}-${PV}-1.x86_64.rpm"

LICENSE="mssql-tools"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="
	dev-db/unixODBC
"

RESTRICT="strip"

S="${WORKDIR}/opt/${PN}"

src_unpack() {
	rpm_unpack
}

src_configure() { :; }
src_compile() { :; }

src_install() {
	insinto /opt/${PN}
	doins -r bin share
	fperms 0755 /opt/${PN}/bin/bcp /opt/${PN}/bin/sqlcmd
	dosym /opt/${PN}/bin/sqlcmd /opt/bin/sqlcmd
	dosym /opt/${PN}/bin/bcp /opt/bin/bcp
}
