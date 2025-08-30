{
  system = import ./system.nix;
  packages = import ./packages.nix;
  homebrew = import ./homebrew.nix;
  fonts = import ./fonts.nix;
  shells = import ./shells.nix;
}
