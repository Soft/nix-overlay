{ stdenv, fetchFromGitHub, buildGoModule }:

buildGoModule rec {
  name = "dnsproxy-${version}";
  version = "0.28.0";

  src = fetchFromGitHub {
    owner = "AdguardTeam";
    repo = "dnsproxy";
    rev = "v${version}";
    sha256 = "1is98j6ajynx1k0rjm1kp0mdkh5k7lldlkj7ykny7mdky8fkl2dw";
  };

  modSha256 = "1m8565hkn981b6xld8jyrbxay48ww8lzr94kgakx0rg5548kd7v5";

  meta = with stdenv.lib; {
    homepage = https://github.com/AdguardTeam/dnsproxy;
    license = licenses.gpl3;
    description = "Simple DNS proxy with DoH, DoT, and DNSCrypt support.";
    platforms = platforms.linux;
  };
}
