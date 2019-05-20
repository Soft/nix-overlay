{ stdenv, fetchFromGitHub, breeze-icons, gtk3 }:

stdenv.mkDerivation rec {
  name = "tela-icon-theme-${version}";
  version = "2019-05-18";

  src = fetchFromGitHub {
    owner = "vinceliuice";
    repo = "Tela-icon-theme";
    rev = "3eb69e73bcfe1e6c31f3748f54da20ffaa7999f1";
    sha256 = "087rmja90dcws27y4nlcxhxn7hbqq10vglyljla1xd9hs5db71cz";
  };

  nativeBuildInputs = [ breeze-icons gtk3 ];

  prePatch = ''
    patchShebangs install.sh
  '';

  installPhase = ''
    mkdir -p $out/share/icons
    ./install.sh -d $out/share/icons
  '';

  meta = with stdenv.lib; {
    homepage = https://github.com/vinceliuice/Tela-icon-theme;
    license = [licenses.gpl3];
    description = "A flat colorful Design icon theme";
    platforms = platforms.linux;
  };
}
