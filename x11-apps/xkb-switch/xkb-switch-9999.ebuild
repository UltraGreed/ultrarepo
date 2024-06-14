# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="Switch your X keyboard layouts from the command line"
HOMEPAGE="https://github.com/grwlf/xkb-switch"
EGIT_REPO_URI="https://github.com/grwlf/xkb-switch.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="x11-libs/libxkbfile"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e "s/DESTINATION lib/DESTINATION $(get_libdir)/" CMakeLists.txt
	cmake_src_prepare
}
