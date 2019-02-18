{ stdenv, fetchFromGitHub, openssl, autoreconfHook }:

stdenv.mkDerivation rec {
  name = "mbox-${version}";
  version = "a131424b6cb577e1c916bd0e8ffb2084a5f73048";

  src = fetchFromGitHub {
    owner = "tsgates";
    repo = "mbox";
    rev = "${version}";
    sha256 = "06qggqxnzcxnc34m6sbafxwr2p64x65m9zm5wp7pwyarcckhh2hd";
  };

  nativeBuildInputs = [ autoreconfHook ];
  buildInputs = [ openssl ];

  sourceRoot = "${src.name}/src";

  preConfigure = ''
    cp {.,}configsbox.h
  '';

  meta = with stdenv.lib; {
    homepage = https://pdos.csail.mit.edu/archive/mbox/;
    license = licenses.mit;
    description = "A lightweight sandbox tool for non-root users";
    platforms = platforms.linux;
  };
}
