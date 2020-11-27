{ stdenv, fetchFromGitHub, qmake, libpulseaudio, wrapQtAppsHook }:

stdenv.mkDerivation rec {
  name = "prettyeq-${version}";
  version = "0.2-alpha";

  src = fetchFromGitHub {
    owner = "keur";
    repo = "prettyeq";
    rev = "v${version}";
    sha256 = "0kana8m74ca5x7gsy98davwrpd3am7bnxa5v07sgj83zh4ddxaa2";
  };

  patches = [ ./install.patch ];

  buildInputs = [ libpulseaudio ];

  nativeBuildInputs = [ qmake wrapQtAppsHook ];

  meta = with stdenv.lib; {
    homepage = https://github.com/keur/prettyeq;
    license = licenses.bsd3;
    description = "prettyeq is a system-wide paramateric equalizer for pulseaudio";
    platforms = platforms.linux;
  };
}
