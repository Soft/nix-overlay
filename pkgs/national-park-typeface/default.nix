{ stdenv, fetchzip }:

stdenv.mkDerivation rec {
  name = "national-park-typeface-${version}";
  version = "2019-06-04";

  src = fetchzip {
    stripRoot = false;
    url = "https://files.cargocollective.com/c206464/NationalPark.zip";
    sha256 = "03lzlyjnjn8mhbqm1bxb55i09lbsf5sa7mw1kslsnz29jmjyhijm";
  };

  installPhase = ''
    install -Dm644 NationalPark-Heavy.otf $out/share/fonts/opentype/NationalPark-Heavy.otf
    install -Dm644 NationalPark-Outline.otf $out/share/fonts/opentype/NationalPark-Outline.otf
    install -Dm644 NationalPark-Regular.otf $out/share/fonts/opentype/NationalPark-Regular.otf
    install -Dm644 NationalPark-Thin.otf $out/share/fonts/opentype/NationalPark-Thin.otf
  '';

  meta = with stdenv.lib; {
    homepage = https://nationalparktypeface.com;
    license = [licenses.ofl];
    description = "A typeface designed to mimic the National Park Service signs that are carved using a router bit.";
    platforms = platforms.all;
  };
}
