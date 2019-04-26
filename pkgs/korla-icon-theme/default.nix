{ stdenv, fetchFromGitHub, breeze-icons, gtk3 }:

stdenv.mkDerivation rec {
  name = "korla-icon-theme-${version}";
  version = "1.0.5";

  src = fetchFromGitHub {
    owner = "bikass";
    repo = "korla";
    rev = "v${version}";
    sha256 = "1a4qq1jcdsznaw235cm3qxj8zvgyql178snkk0wyfjsgqbv8160y";
  };

  nativeBuildInputs = [ breeze-icons gtk3 ];

  installPhase = ''
    mkdir -p $out/share/icons
    mv korla $out/share/icons
  '';

  postInstall = ''
    gtk-update-icon-cache $out/share/icons/korla"
  '';

  meta = with stdenv.lib; {
    homepage = https://github.com/bikass/korla;
    license = [licenses.gpl3];
    description = "Korla icon theme is a mix of following icon sets: La Capitaine, MacOS11, Papirus.";
    platforms = platforms.linux;
  };
}
