{ stdenv, fetchFromGitHub, pkgconfig, gtk3, emacs, autoreconfHook }:

stdenv.mkDerivation rec {
  name = "emacs-gtk-style-ext-${version}";
  version = "0.1";

  src = fetchFromGitHub {
    owner = "Soft";
    repo = "emacs-gtk-style-ext";
    rev = "5eecd16ed3d8f32e1431c591165c24981bf90f33";
    sha256 = "1nkgqss1yn2abhwpzhhzf4c3myv1s6jczmxmwi6wvk5hk91hsa0w";
  };

  nativeBuildInputs = [ autoreconfHook ];
  buildInputs =  [ emacs pkgconfig gtk3 ];

  installPhase = ''
    mkdir -p  "$out/share/emacs/site-lisp"
    cp gtk-style-ext.el "$out/share/emacs/site-lisp"
    cp .libs/gtk-style-ext-sys.so "$out/share/emacs/site-lisp"
  '';

  meta = with stdenv.lib; {
    homepage = https://github.com/Soft/emacs-gtk-style-ext;
    license = licenses.gpl3;
    description = "Control Emacs' gtk3 front-end's theme and styles";
    platforms = platforms.linux;
  };
}
