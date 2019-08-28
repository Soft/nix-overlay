{ stdenv, fetchFromGitHub, autoreconfHook, pkgconfig, ncurses }:

stdenv.mkDerivation rec {
  name = "rainbowpath-${version}";
  version = "0.4";

  src = fetchFromGitHub {
    owner = "Soft";
    repo = "rainbowpath";
    rev = "${version}";
    sha256 = "1yb3zn7553hsqmd9r64d5hkbax9nzhmq6pxyl4n4wnmbg9m1nkvx";
  };

  nativeBuildInputs = [ autoreconfHook pkgconfig ];

  buildInputs = [ ncurses ];

  preFixup = ''
    mkdir -p "$out/man/man1"
    cp "$src/man/rainbowpath.1" "$out/man/man1"
  '';

  meta = with stdenv.lib; {
    homepage = https://github.com/Soft/rainbowpath;
    license = licenses.mit;
    description = "Program for making paths pretty";
    platforms = platforms.linux;
  };
}
