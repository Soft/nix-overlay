{ stdenv, cmake, extra-cmake-modules, plasma-framework, kwindowsystem, fetchFromGitHub, }:

stdenv.mkDerivation rec {
  name = "plasma-applet-weather-widget-${version}";
  version = "1.6.10";

  src = fetchFromGitHub {
    owner = "kotelnik";
    repo = "plasma-applet-weather-widget";
    rev = "v${version}";
    sha256 = "17hwqjzj00gwyx6rxy0vkvns25x42kqkhs131kz9cibij3n7cgix";
  };

  nativeBuildInputs = [
     cmake
     extra-cmake-modules
  ];

  buildInputs = [
     plasma-framework
     kwindowsystem
  ];

  dontWrapQtApps = true;

  meta = with stdenv.lib; {
    description = "Plasma 5 applet for displaying weather information from yr.no server.";
    homepage = https://github.com/kotelnik/plasma-applet-weather-widget;
    license = licenses.gpl2;
    platforms = platforms.linux;
  };
}
