{ stdenv, fetchFromGitHub, breeze-icons, gtk3 }:

stdenv.mkDerivation rec {
  name = "la-capitaine-icon-theme-${version}";
  version = "0.6.1";

  src = fetchFromGitHub {
    owner = "keeferrourke";
    repo = "la-capitaine-icon-theme";
    rev = "v${version}";
    sha256 = "0cm2scrcg5h45y56h822ywyvfzns1x4wf3gqq96cwb22dc7ny1g9";
  };

  nativeBuildInputs = [ breeze-icons gtk3 ];

  preConfigure = "rm ./configure";

  installPhase = ''
    mkdir -p $out/share/icons/la-capitaine
    mv actions \
       animations \
       apps \
       devices \
       emblems \
       emotes \
       mimetypes \
       panel \
       places \
       status \
       index.theme \
       $out/share/icons/la-capitaine
  '';

  postInstall = ''
    gtk-update-icon-cache $out/share/icons/la-capitaine"
  '';

  meta = with stdenv.lib; {
    homepage = https://krourke.org/projects/art/la-capitaine-icon-theme;
    license = [licenses.mit licenses.gpl3];
    description = "La Capitaine is an icon pack designed to integrate with most desktop environments.";
    platforms = platforms.linux;
  };
}
