{ stdenv, fetchFromGitHub, python3, libxcb }:

let
  moz_overlay = import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz);
  nixpkgs = import <nixpkgs> { overlays = [ moz_overlay ]; };
  moz_buildRustPackage = nixpkgs.callPackage (import <nixpkgs/pkgs/build-support/rust>) {
    rust = {
      rustc = nixpkgs.latest.rustChannels.stable.rust;
      cargo = nixpkgs.latest.rustChannels.stable.cargo;
    };
  };
in
moz_buildRustPackage rec {
  name = "xcolor-${version}";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "Soft";
    repo = "xcolor";
    rev = "${version}";
    sha256 = "1nxyy0d12xw1pksshxl31h2fzcaqazlw60g1h279jh103b2xdbhz";
  };

  cargoSha256 = "0wm89q9i0qb32c21jfvcrp3d58685npdzqpvdi16h92hsnz42pzy";

  buildInputs = [ libxcb python3 ];

  preFixup = ''
    mkdir -p "$out/man/man1"
    cp "$src/man/xcolor.1" "$out/man/man1"
  '';

  meta = with stdenv.lib; {
    homepage = https://soft.github.io/xcolor/;
    license = licenses.mit;
    description = "Lightweight color picker for X11";
    platforms = platforms.linux;
  };
}
