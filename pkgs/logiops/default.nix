{ stdenv, fetchFromGitHub, cmake, libconfig, libevdev, pkgconfig, systemd }:

stdenv.mkDerivation rec {
  name = "logiops-${version}";
  version = "0.2.2";

  src = fetchFromGitHub {
    owner = "PixlOne";
    repo = "logiops";
    rev = "v${version}";
    sha256 = "1hqcvbkbqmy299y8q8hb699cz87x5p0sas311k6m5apjmkwpf6sj";
  };

  patches = [ ./systemd.patch ];

  nativeBuildInputs = [ cmake pkgconfig ];

  buildInputs = [ libconfig libevdev systemd ];

  meta = with stdenv.lib; {
    homepage = https://github.com/PixlOne/logiops;
    license = licenses.gpl3;
    description = "An unofficial userspace driver for HID++ Logitech devices";
    platforms = platforms.linux;
  };
}
