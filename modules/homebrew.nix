{ ... }: {
  homebrew = {
    enable = true;
    brews = [
      "llvm"
      "clang-format"
      "libomp"
      "flang"
      "urlview"
      "bitwarden-cli" # equivalent nixpkg is broken
      "ford"
      "luarocks"
      "arduino-cli"
      "fpm"
    ];
    casks = [
      # audio loopback driver
      "blackhole-64ch"
      "obs"
      "bitwarden" #desktop
      # arduino ide
      "arduino-ide"
      # Terminal
      "wezterm"
      "visual-studio-code"
      # Notes/Research
      "obsidian"
      "zotero"
      "skim"
      # Window tiling manager
      "rectangle"
      "zoom"
      "slack"
      "discord"
      # Microsoft sh t
      "microsoft-word"
      "microsoft-excel"
      "microsoft-teams"
      # LLMS
      "claude"
      "telegram"
      # VPN
      "nordvpn"
      # Browsers
      "brave-browser"
      "librewolf"
      "zen"
      "tor-browser"
      # email
      "docker-desktop"
      # Cloud
      "nextcloud"
      "megasync"
      # OS image
      "balenaetcher"
      "raspberry-pi-imager"
      # OpenVPN client
      "tunnelblick"
      "localsend"
    ];
    masApps = {
      # Add Mac App Store apps here
      "Flighty" = 1358823008;
      "Wireguard" = 1451685025;
      "HP" = 1474276998;
      "The Unarchiver" = 425424353;
      # "Xcode" = 497799835;
      #TODO Proton Authenticator yet to packaged
    };
    # onActivation.cleanup = "zap";
  };
}
