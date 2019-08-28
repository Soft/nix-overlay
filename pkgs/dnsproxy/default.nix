{ stdenv, fetchFromGitHub, buildGoModule }:

buildGoModule rec {
  name = "dnsproxy-${version}";
  version = "0.18.4";

  src = fetchFromGitHub {
    owner = "AdguardTeam";
    repo = "dnsproxy";
    rev = "v${version}";
    sha256 = "0xsji3wmh28fq5iq7kb814sls92j553pwr2gk1gcy9rgvrsd7bas";
  };

  modSha256 = "0y56j6bc29jh7zhk130iwwa736ggn7kjc2xj0z8b64fjs6cz6frd";

  meta = with stdenv.lib; {
    homepage = https://github.com/AdguardTeam/dnsproxy;
    license = licenses.gpl3;
    description = "Simple DNS proxy with DoH, DoT, and DNSCrypt support.";
    platforms = platforms.linux;
  };
}
