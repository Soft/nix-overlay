selft: super:

{
  rainbowpath = super.callPackage ./pkgs/rainbowpath {};
  run-or-raise = super.callPackage ./pkgs/run-or-raise {};
  cargo-watch = super.callPackage ./pkgs/cargo-watch {};
  la-capitaine-icon-theme = super.callPackage ./pkgs/la-capitaine-icon-theme {};
  korla-icon-theme = super.callPackage ./pkgs/korla-icon-theme {};
  plasma-applet-weather-widget = super.libsForQt5.callPackage ./pkgs/plasma-applet-weather-widget {};
}
