{ stdenv, fetchFromGitHub, unzip }:

stdenv.mkDerivation rec {
  name = "victor-mono-${version}";
  version = "1.2.5";

  src = fetchFromGitHub {
    owner = "rubjo";
    repo = "victor-mono";
    rev = "v${version}";
    sha256 = "199wb6641ys4krw7csgys21l7m8m245mpjjgi918jbki285s753q";
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
