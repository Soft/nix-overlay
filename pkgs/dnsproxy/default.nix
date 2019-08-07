{ stdenv, fetchFromGitHub, buildGoModule }:

buildGoModule rec {
  name = "dnsproxy-${version}";
  version = "0.17.2";

  src = fetchFromGitHub {
    owner = "AdguardTeam";
    repo = "dnsproxy";
    rev = "v${version}";
    sha256 = "11r88yxggp47fh8f37rakqr5w8amjg7f45arr8ybk41m9dllb5z0";
  };

  modSha256 = "0ii9a1rbqvwfraji1ghw1408difxiwss3gsbbkljwp25qmpzcavc";

  meta = with stdenv.lib; {
    homepage = https://github.com/AdguardTeam/dnsproxy;
    license = licenses.gpl3;
    description = "Simple DNS proxy with DoH, DoT, and DNSCrypt support.";
    platforms = platforms.linux;
  };
}
