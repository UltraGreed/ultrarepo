# Copyright 2022-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit edo

DESCRIPTION="The officially unofficial Ziglang language server"
HOMEPAGE="https://github.com/zigtools/zls"

SRC_URI="https://github.com/zigtools/zls/releases/download/${PV}/zls-x86_64-linux.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

EZIG_MIN="0.13"
EZIG_MAX_EXCLUSIVE="0.14"

DEPEND="|| ( dev-lang/zig:${EZIG_MIN} dev-lang/zig-bin:${EZIG_MIN} )"
RDEPEND="${DEPEND}"

# see https://github.com/ziglang/zig/issues/3382
# For now, Zig Build System doesn't support CFLAGS/LDFLAGS/etc.
QA_FLAGS_IGNORED="usr/bin/zls"

QA_PREBUILT="opt/${P}/zls"

src_unpack() {
	unpack ${A}

	mkdir "${S}"

	find . -maxdepth 1 -mindepth 1 ! -name "${P}" -exec mv -t "${S}" -- {} + || die
}

src_install() {
	insinto /opt/

	dodoc README.md

	doins -r "${S}"
	fperms 0755 "/opt/${P}/zls"

	dosym -r "/opt/${P}/zls" "/usr/bin/zls"
}

pkg_postinst() {
	elog "You can find more information about options here https://github.com/zigtools/zls#configuration-options"
}
