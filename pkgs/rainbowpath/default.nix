{ stdenv, fetchFromGitHub, autoreconfHook }:

stdenv.mkDerivation rec {
  name = "rainbowpath-${version}";
  version = "0.3.1";

  src = fetchFromGitHub {
    owner = "Soft";
    repo = "rainbowpath";
    rev = "${version}";
    sha256 = "04w11i8zb1xfv0kc5nms0fdhz5is1vcjsq1pyxq0ss3bvq0rk3hn";
  };

  nativeBuildInputs = [ autoreconfHook ];

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
