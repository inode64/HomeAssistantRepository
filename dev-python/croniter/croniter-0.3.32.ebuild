# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6..8} )

inherit distutils-r1

DESCRIPTION="Python module to provide iteration for datetime object"
HOMEPAGE="https://github.com/kiorky/croniter https://pypi.org/project/croniter/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm arm64 x86 amd64-linux x86-linux"
IUSE="test"
RESTRICT="!test? ( test )"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytz[${PYTHON_USEDEP}]
	)"
RDEPEND="dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/natsort[${PYTHON_USEDEP}]"
python_test() {
	py.test -v src/croniter/tests || die "tests failed"
}
