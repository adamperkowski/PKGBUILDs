# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
pkgname='hyprwall'
pkgver=0.1.8
pkgrel=3
pkgdesc='GUI for setting wallpapers on Wayland (multiple backends). Written in blazingly fast Rust!'
arch=('x86_64')
url="https://github.com/hyprutils/$pkgname"
license=('GPL-2.0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('72f6b2744a6f9fe8f09400bcbf6a589b53265bd6c430ffed3965122409127f57')
makedepends=('rustup' 'pango' 'glibc' 'gcc-libs')
depends=('gtk4')
optdepends=('hyprpaper' 'swaybg' 'swww' 'wallutils' 'feh')
install="$pkgname.install"

prepare() {

    local oldinstall=$(cat "$startdir/$install")
    echo -n "optdepends=(" > "$startdir/$install"
    for dep in "${optdepends[@]}"; do
        echo -n "'$dep' " >> "$startdir/$install"
    done
    echo -e ")\n$oldinstall" >> "$startdir/$install"

    echo "Version=$pkgver" >> "$pkgname.desktop"
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
    install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 "man/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
    install -Dm644 "$pkgname.png" -t "$pkgdir/usr/share/icons"
    install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications"
    install -Dm644 readme.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
