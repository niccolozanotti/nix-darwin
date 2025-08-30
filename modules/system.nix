{ pkgs, config, ... }: {

  # nix is managed by DeterminateSystems:
  nix.enable = false;
  # Necessary for using flakes on this system
  nix.settings.experimental-features = "nix-command flakes";
  # Build binaries for linux using a bootrapped NixOS VM
  # nix.linux-builder.enable = true;
  
  # System user
  system.primaryUser = "niccolozanotti";
  
  # Used for backwards compatibility
  system.stateVersion = 6;
  
  # Allow non open-source packages
  nixpkgs.config.allowUnfree = true;
  # Platform configuration
  nixpkgs.hostPlatform = "aarch64-darwin";
  
  # Application symlink setup
  system.activationScripts.applications.text = 
  let
    env = pkgs.buildEnv {
      name = "system-applications";
      paths = config.environment.systemPackages;
      pathsToLink = "/Applications";
    };
  in
    # alias nix-installed apps to /Applications (for indexing, etc ...)
    pkgs.lib.mkForce ''
      # Set up applications.
      echo "setting up /Applications..." >&2
      rm -rf /Applications/Nix\ Apps
      mkdir -p /Applications/Nix\ Apps
      find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
      while read -r src; do
        app_name=$(basename "$src")
        echo "copying $src" >&2
        ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
      done
    '';
  security.pam.services.sudo_local.touchIdAuth = true;
  
  system.defaults = {
    dock.autohide = true;
    dock.mru-spaces = false;
    dock.persistent-apps = [
      "/System/Applications/Launchpad.app"
      "/System/Applications/Mail.app"
      "${pkgs.wezterm}/Applications/WezTerm.app"
      "${pkgs.obsidian}/Applications/Obsidian.app"
      "/System/Applications/Calendar.app"
      "/System/Applications/Photos.app"
      "/System/Applications/Contacts.app"
    ];
    finder.AppleShowAllExtensions = true;
    finder.FXPreferredViewStyle = "Nlsv"; #list view
    # finder.NewWindowTarget = "";
    loginwindow.GuestEnabled = false;
    loginwindow.LoginwindowText = "LoginwindowText";
    screencapture.location = "~/Documents/screenshots";
    screensaver.askForPasswordDelay = 10;
    # NSGlobalDomain.AppleICUForce24HourTime = true;
    # NSGlobalDomain.AppleInterfaceStyle = "Dark";
    # NSGlobalDomain.KeyRepeat = 2;
  };
}
