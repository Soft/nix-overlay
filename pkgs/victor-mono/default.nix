{ stdenv, fetchFromGitHub, unzip }:

stdenv.mkDerivation rec {
  name = "victor-mono-${version}";
  version = "1.2.2";

  src = fetchFromGitHub {
    owner = "rubjo";
    repo = "victor-mono";
    rev = "v${version}";
    sha256 = "15pihpnhh4iim79m8sgadh0i8wb0znfdlhh64kfi4gfpxpg86jka";
  };

  installPhase = ''
    mkdir -p $out/share/fonts/opentype
    unzip -j $src/public/VictorMonoAll.zip 'OTF/*.otf' -d $out/share/fonts/opentype
  '';

  nativeBuildInputs = [ unzip ];

  meta = with stdenv.lib; {
    homepage = https://rubjo.github.io/victor-mono/;
    license = [licenses.mit];
    description = "Victor Mono is a free programming font with semi-connected cursive italics and symbol ligatures";
    platforms = platforms.all;
  };
}
