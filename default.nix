self: super:

{
  cargo-watch = super.callPackage ./pkgs/cargo-watch {};
  dnsproxy = super.callPackage ./pkgs/dnsproxy {};
  emacs-gtk-style-ext = super.callPackage ./pkgs/emacs-gtk-style-ext {};
  genius-now-playing = super.callPackage ./pkgs/genius-now-playing {};
  korla-icon-theme = super.callPackage ./pkgs/korla-icon-theme {};
  la-capitaine-icon-theme = super.callPackage ./pkgs/la-capitaine-icon-theme {};
  logiops = super.callPackage ./pkgs/logiops {};
  mbox = super.callPackage ./pkgs/mbox {};
  national-park-typeface = super.callPackage ./pkgs/national-park-typeface {};
  plasma-applet-weather-widget = super.libsForQt5.callPackage ./pkgs/plasma-applet-weather-widget {};
  prettyeq = super.libsForQt5.callPackage ./pkgs/prettyeq {};
  procs = super.callPackage ./pkgs/procs {};
  rainbowpath = super.callPackage ./pkgs/rainbowpath {};
  run-or-raise = super.callPackage ./pkgs/run-or-raise {};
  bulkrename = super.callPackage ./pkgs/bulkrename {};
  tela-icon-theme = super.callPackage ./pkgs/tela-icon-theme {};
  victor-mono = super.callPackage ./pkgs/victor-mono {};
  xcolor = super.callPackage ./pkgs/xcolor {};
}
