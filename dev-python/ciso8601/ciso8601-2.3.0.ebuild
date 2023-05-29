# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Fast ISO8601 date time parser for Python written in C"
HOMEPAGE="https://github.com/closeio/ciso8601 https://pypi.org/project/ciso8601/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytz[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
