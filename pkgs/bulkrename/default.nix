{ stdenv, fetchFromGitHub, rustPlatform }:

rustPlatform.buildRustPackage rec {
  name = "bulkrename-${version}";
  version = "0.1.2";

  src = fetchFromGitHub {
    owner = "Soft";
    repo = "bulkrename";
    rev = "${version}";
    sha256 = "0062zrjzrld0c61pn08innj4jyzfc4d4b4009a288m8jjxs3cj1p";
  };

  cargoSha256 = "11p7yg69kip2jb40l4ahm5iivb1iz48fd16zbknmy01gv3i5v8bh";

  meta = with stdenv.lib; {
    homepage = https://github.com/Soft/bulkrename;
    license = licenses.mit;
    description = "bulkrename is a tool for renaming large numbers of files.";
    platforms = platforms.linux;
  };
}
