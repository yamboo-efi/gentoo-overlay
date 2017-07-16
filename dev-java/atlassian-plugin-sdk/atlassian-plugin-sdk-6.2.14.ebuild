# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Atlassian Plugin SDK"
HOMEPAGE="https://marketplace.atlassian.com/plugins/atlassian-plugin-sdk-tgz/versions"
SRC_URI="https://marketplace.atlassian.com/download/plugins/atlassian-plugin-sdk-tgz/version/42390 -> ${P}.tar.gz"

LICENSE="Atlassian Developer Terms"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=dev-java/oracle-jdk-bin-1.8"

S="${WORKDIR}"/${PN}-${PV}

src_install() {
    local mvn_version="apache-maven-3.2.1"

    insinto /opt/${PN}

    # Delete not needed files
    rm -vf "${mvn_version}/bin/*.bat" || die
    rm -vf "${mvn_version}/bin/*.orig" || die
    rm -vf "${mvn_version}/config/*.orig" || die

    doins -r ${mvn_version} bin repository

    fperms 0755 /opt/${PN}/${mvn_version}/bin/mvn

    for cmd in ${S}/bin/*; do
        dosym "/opt/${PN}/bin/${cmd##*/}" "/usr/bin/${cmd##*/}"
        fperms 0755 /opt/${PN}/bin/${cmd##*/}
    done
}