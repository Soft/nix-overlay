{ stdenv, fetchFromGitHub, autoreconfHook, pkgconfig, ncurses }:

stdenv.mkDerivation rec {
  name = "rainbowpath-${version}";
  version = "0.5.1";

  src = fetchFromGitHub {
    owner = "Soft";
    repo = "rainbowpath";
    rev = "${version}";
    sha256 = "0ifw0pfpv18lpn3pa74vk8nrh0fskidxkrca36vas2rz51cs7z2q";
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
