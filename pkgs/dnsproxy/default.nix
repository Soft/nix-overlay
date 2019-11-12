{ stdenv, fetchFromGitHub, buildGoModule }:

buildGoModule rec {
  name = "dnsproxy-${version}";
  version = "0.20.0";

  src = fetchFromGitHub {
    owner = "AdguardTeam";
    repo = "dnsproxy";
    rev = "v${version}";
    sha256 = "0yd3d90ssdzpbsdq068dvsi0r1z2rlv3wpbmpkhfgpxmwrvdanrq";
  };

  modSha256 = "0yhwd78sdmwyz8lji6j8si9fig364q1vh9maxggn0ixqykyy11ks";

  meta = with stdenv.lib; {
    homepage = https://github.com/AdguardTeam/dnsproxy;
    license = licenses.gpl3;
    description = "Simple DNS proxy with DoH, DoT, and DNSCrypt support.";
    platforms = platforms.linux;
  };
}
