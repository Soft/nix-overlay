{ stdenv, fetchFromGitHub, python3, libxcb, rustPlatform }:

rustPlatform.buildRustPackage rec {
  name = "run-or-raise-${version}";
  version = "0.3.2";

  src = fetchFromGitHub {
    owner = "Soft";
    repo = "run-or-raise";
    rev = "${version}";
    sha256 = "0k1r0s4pa578zwsa7gk5wnl94g2cmjybhckh6y1vglmjjqnrsc6i";
  };

  cargoSha256 = "1jzxr2xcv8w99fdzym5azmf3brla79f8ryqg2x7pq9zk8jbiyap0";

  buildInputs = [ libxcb python3 ];

  preFixup = ''
    mkdir -p "$out/man/man1"
    cp "$src/man/run-or-raise.1" "$out/man/man1"
  '';

  meta = with stdenv.lib; {
    homepage = https://github.com/Soft/run-or-raise;
    license = licenses.gpl3;
    description = "Utility for launching applications or focusing their windows";
    platforms = platforms.linux;
  };
}
