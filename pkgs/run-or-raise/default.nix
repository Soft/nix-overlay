{ stdenv, fetchFromGitHub }:

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
  name = "run-or-raise-${version}";
  version = "0.3.2";

  src = fetchFromGitHub {
    owner = "Soft";
    repo = "run-or-raise";
    rev = "${version}";
    sha256 = "0k1r0s4pa578zwsa7gk5wnl94g2cmjybhckh6y1vglmjjqnrsc6i";
  };

  cargoSha256 = "0j4znvpi60wx92lvdp0a0hdjgd228yxlcvmkrk49mqjnmp14x250";

  buildInputs = with nixpkgs; [ xorg.libxcb python3 ];

  preFixup = ''
    mkdir -p "$out/man/man1"
    cp "$src/man/run-or-raise.1" "$out/man/man1"
  '';

  meta = with stdenv.lib; {
    homepage = https://github.com/Soft/run-or-raise;
    license = licenses.gpl3;
    description = "Utility for launching applications or focusing their windows";
    platforms = platforms.linux;
  };
}
