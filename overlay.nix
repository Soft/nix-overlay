selft: super:

{
  rainbowpath = super.callPackage ./pkgs/rainbowpath {};
  run-or-raise = super.callPackage ./pkgs/run-or-raise {};
  cargo-watch = super.callPackage ./pkgs/cargo-watch {};
}
