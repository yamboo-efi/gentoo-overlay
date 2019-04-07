# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

MY_PN="NetworkManager-l2tp"

DESCRIPTION="NetworkManager L2TP - for L2TP and L2TP over IPSec VPN support."
HOMEPAGE="https://github.com/nm-l2tp/network-manager-l2tp"
SRC_URI="https://github.com/nm-l2tp/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gnome"

DEPEND="sys-devel/gettext
	dev-util/intltool
	virtual/pkgconfig
	>=net-misc/networkmanager-1.2.0
	>=dev-libs/dbus-glib-0.74
	=net-dialup/ppp-2.4.7*
	net-dialup/xl2tpd
	net-vpn/libreswan
	gnome? (
		x11-libs/gtk+:3
		gnome-base/gconf:2
		gnome-base/gnome-keyring
	)"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_PN}-${PV}"

src_prepare() {
	eautoreconf
        default
}

src_configure() {
	ECONF="--with-dist-version=Gentoo
	       $(use_with gnome)"

	econf ${ECONF}
}
