{ stdenv, fetchFromGitHub, buildGoModule }:

buildGoModule rec {
  name = "dnsproxy-${version}";
  version = "0.16.0";

  src = fetchFromGitHub {
    owner = "AdguardTeam";
    repo = "dnsproxy";
    rev = "v${version}";
    sha256 = "0km48rxrmj8pgx5n2hjlrzzjg95b5s8f0m2wjbw4v030fbskjmcb";
  };

  modSha256 = "1zikqqldilph6hjgpk81h2p6slgdcvadhdj294cmmzh1dvypigkp";

  meta = with stdenv.lib; {
    homepage = https://github.com/AdguardTeam/dnsproxy;
    license = licenses.gpl3;
    description = "Simple DNS proxy with DoH, DoT, and DNSCrypt support.";
    platforms = platforms.linux;
  };
}
