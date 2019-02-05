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
  name = "cargo-watch-${version}";
  version = "7.1.1";

  src = fetchFromGitHub {
    owner = "passcod";
    repo = "cargo-watch";
    rev = "v${version}";
    sha256 = "1mcgb2cwd6xxiw6hqyvb2wbmigf62grsc5h85ww7lhdy59fbg8gi";
  };

  cargoSha256 = "0vvix9cf8sjhrjnyfl63hc7yhbf897a8x9w8s2s0issknk6sfnzn";

  meta = with stdenv.lib; {
    homepage = https://github.com/passcod/cargo-watch;
    license = licenses.cc0;
    description = "Watches over your Cargo project's source";
  };
}
