# Contributor: alphazo <alphazo@gmail.com>
# Original PKGBUILD generated by pip2arch

pkgname=ntfy
pkgver=2.7.0
pkgrel=3
pkgdesc="A utility for sending push notifications to different backends (Pushover, Pushbullet, XMPP and various desktop notification systems)"
url="https://github.com/dschep/ntfy"
depends=('python' 'python-requests' 'python-yaml' 'python-appdirs' 'xorg-xprop' 'python-ruamel-yaml')
makedepends=('python3' 'python-setuptools')
optdepends=('python-dbus' 'python-emoji' )
license=('GPLv3')
arch=('any')
source=(https://github.com/dschep/ntfy/archive/v$pkgver.tar.gz)
md5sums=('c468c732cac0b4641af93b3ac95c6412')

prepare() {
    cd "$srcdir/${pkgname}-${pkgver}"
    sed -i 's/getargspec/getfullargspec/' ntfy/__init__.py
}

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 
}
