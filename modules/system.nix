{ pkgs, config, ... }: {

  # nix is managed by DeterminateSystems:
  nix.enable = false;
  # Necessary for using flakes on this system
  nix.settings.experimental-features = "nix-command flakes";
  # Build binaries for linux using a bootrapped NixOS
  # Ouch: not allowed if nix manged by DeterminateSystems
  # nix.linux-builder.enable = true;
  
  nixpkgs.hostPlatform = "aarch64-darwin";
  system.primaryUser = "niccolozanotti";
  
  # Used for backwards compatibility
  system.stateVersion = 6;
  
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

  # override Apple’s built-in OpenSSH server
  services.openssh.enable = false;
  # config loaded in sshd_config
  # services.openssh.extraConfig = "string1\nstring2"


  security = {
    pam.services.sudo_local.enable = true;
    pam.services.sudo_local.touchIdAuth = true;
    pam.services.sudo_local.reattach = true; # touchID in tmux
  };

  time.timeZone = "Europe/Rome";
  
  system.defaults = {
    dock.autohide = true;
    dock.autohide-time-modifier = 0.5;
    dock.mru-spaces = false;
    dock.minimize-to-application = true;
    dock.orientation = "left";
    dock.expose-group-apps = true;
    dock.show-recents = false;
    dock.showhidden = true;
    dock.largesize = 128; #16-128
    dock.tilesize = 30; # default = 64
    dock.magnification = true;
    dock.persistent-apps = [
      "/System/Applications/Launchpad.app"
      "/Applications/Brave Browser.app"
      "/Applications/Librewolf.app"
      "/Applications/WezTerm.app"
      "/Applications/Visual Studio Code.app"
      "/System/Applications/Mail.app"
      "/System/Applications/Calendar.app"
      "/System/Applications/System Settings.app"
      "/Applications/Obsidian.app"
      "/Applications/Claude.app/"
      "/Applications/Bitwarden.app"
      {
        spacer = {
          small = true;
        };
      }
      {
        folder = "/Users/niccolozanotti/Downloads/";
      }
    ];

    controlcenter.BatteryShowPercentage = true;
    controlcenter.Sound = true;

    finder.AppleShowAllExtensions = true;
    finder.FXPreferredViewStyle = "Nlsv"; #list view
    finder.NewWindowTarget = "Home";
    finder.QuitMenuItem = true;
    # finder.ShowPathbar = true;
    finder.ShowStatusBar = true;

    loginwindow.GuestEnabled = false;
    loginwindow.LoginwindowText = "Back soon :)";

    screencapture.location = "~/Documents/Screenshots";
    screencapture.type = "png";
    screensaver.askForPasswordDelay = 10;

    NSGlobalDomain.AppleICUForce24HourTime = false;
    NSGlobalDomain.AppleInterfaceStyleSwitchesAutomatically = true;
    NSGlobalDomain.AppleMeasurementUnits = "Centimeters";
    NSGlobalDomain.AppleMetricUnits = 1;
    NSGlobalDomain.AppleTemperatureUnit = "Celsius";
    # NSGlobalDomain.InitialKeyRepeat = 2;
    # NSGlobalDomain.KeyRepeat = 2;
    NSGlobalDomain.NSAutomaticCapitalizationEnabled = false;
    NSGlobalDomain.NSDocumentSaveNewDocumentsToCloud = false;
    NSGlobalDomain.NSTableViewDefaultSizeMode = 2;
    NSGlobalDomain.NSWindowShouldDragOnGesture = true;
    NSGlobalDomain."com.apple.mouse.tapBehavior" = 1;
    NSGlobalDomain."com.apple.sound.beep.volume" = 0.4723665; #25%

    SoftwareUpdate.AutomaticallyInstallMacOSUpdates = false;

    hitoolbox.AppleFnUsageType = "Change Input Source";

    iCal."TimeZone support enabled" = true;
    iCal."first day of week" = "Monday";

    magicmouse.MouseButtonMode = "TwoButton";

    trackpad.ActuationStrength = 0; # Silent Clicking
    trackpad.Clicking = true;
    trackpad.TrackpadRightClick = true;
  };
}
