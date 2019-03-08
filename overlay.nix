self: super:

{
  cargo-watch = super.callPackage ./pkgs/cargo-watch {};
  emacs-gtk-style-ext = super.callPackage ./pkgs/emacs-gtk-style-ext {};
  korla-icon-theme = super.callPackage ./pkgs/korla-icon-theme {};
  la-capitaine-icon-theme = super.callPackage ./pkgs/la-capitaine-icon-theme {};
  mbox = super.callPackage ./pkgs/mbox {};
  plasma-applet-weather-widget = super.libsForQt5.callPackage ./pkgs/plasma-applet-weather-widget {};
  procs = super.callPackage ./pkgs/procs {};
  rainbowpath = super.callPackage ./pkgs/rainbowpath {};
  run-or-raise = super.callPackage ./pkgs/run-or-raise {};
  xcolor = super.callPackage ./pkgs/xcolor {};
}
