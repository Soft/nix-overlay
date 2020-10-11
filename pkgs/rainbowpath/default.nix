{ stdenv, fetchFromGitHub, autoreconfHook, pkgconfig, ncurses }:

stdenv.mkDerivation rec {
  name = "rainbowpath-${version}";
  version = "0.5";

  src = fetchFromGitHub {
    owner = "Soft";
    repo = "rainbowpath";
    rev = "${version}";
    sha256 = "14jwsx0ap6nyw2qd3aczx2ih5f0md2dzlxqah3l6s0wncvk7fypi";
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
