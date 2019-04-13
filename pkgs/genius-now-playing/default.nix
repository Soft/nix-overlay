{ stdenv, python37, fetchFromGitHub }:

with python37.pkgs;

buildPythonApplication rec {
  pname = "genius-now-playing";
  version = "0.1";

  src = fetchFromGitHub {
    owner = "Soft";
    repo = "genius-now-playing";
    rev = "${version}";
    sha256 = "0lic944gkqx98y33pcdhpd2gnpnz848d2zgk3q5p4xylywclhplc";
  };

  propagatedBuildInputs = [ click dbus-python requests ];

  preConfigure = ''
    sed -i 's/"dbus-python",//' setup.py
  '';

  meta = with stdenv.lib; {
    homepage = https://github.com/Soft/genius-now-playing;
    description = "Open currently playing song on Genius.com";
    license = licenses.mit;
  };
}
