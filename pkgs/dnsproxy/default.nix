{ stdenv, fetchFromGitHub, buildGoModule }:

buildGoModule rec {
  name = "dnsproxy-${version}";
  version = "0.32.6";

  src = fetchFromGitHub {
    owner = "AdguardTeam";
    repo = "dnsproxy";
    rev = "v${version}";
    sha256 = "0wcn2wr521n2vcmpnwphgycq109251nkfdr0wzn7lk2zl5qx81ax";
  };

  modSha256 = "192g9jic106wl6c59jm6jisqf7rcgmjzrf7kqlshkpisv18fc3dl";

  meta = with stdenv.lib; {
    homepage = https://github.com/AdguardTeam/dnsproxy;
    license = licenses.gpl3;
    description = "Simple DNS proxy with DoH, DoT, and DNSCrypt support.";
    platforms = platforms.linux;
  };
}
