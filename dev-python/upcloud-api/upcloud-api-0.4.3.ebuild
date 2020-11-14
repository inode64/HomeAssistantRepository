# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6,7} )

inherit distutils-r1

DESCRIPTION="UpCloud API Client"
HOMEPAGE="https://github.com/UpCloudLtd/upcloud-python-api https://pypi.org/project/upcloud-api/"
SRC_URI="https://github.com/UpCloudLtd/upcloud-python-api/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND=">=dev-python/requests-2.6.0[${PYTHON_USEDEP}]
	>=dev-python/six-1.9.0[${PYTHON_USEDEP}]"
DEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}
