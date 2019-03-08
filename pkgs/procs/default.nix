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
  name = "procs-${version}";
  version = "0.6.0";

  src = fetchFromGitHub {
    owner = "dalance";
    repo = "procs";
    rev = "v${version}";
    sha256 = "0gpc5c34j4q1g8lqqwif6mq7x819sdqx00c5cv4n94m3vh5nny36";
  };

  cargoSha256 = "105qc6gb8s1v6jdvqbn6cy2p6ffr2j42wp6n4szr2dzb2ycvm5ic";

  meta = with stdenv.lib; {
    homepage = https://github.com/dalance/procs;
    license = licenses.mit;
    description = "A modern replacement for ps written by Rust";
    platforms = platforms.linux;
  };
}
