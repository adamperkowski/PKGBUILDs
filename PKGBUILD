# Maintainer: Adam Perkowski <adas1per@protonmail.com>
pkgname='hyprlauncher'
pkgver=0.1.4
pkgrel=1
pkgdesc='GUI for launching applications, written in blazingly fast Rust!'
arch=('x86_64')
url="https://github.com/nnyyxxxx/$pkgname"
license=('GPL-2.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nnyyxxxx/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('88e95e90e19ed00ce19e9c2a5af365c92203611ed8ca9f7def66c578c0d31822')
makedepends=('rustup' 'glibc' 'gcc-libs')
depends=('gtk4')

prepare() {
    export RUSTUP_TOOLCHAIN=stable

    cd "$pkgname-$pkgver"

    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "$pkgname-$pkgver"

    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
