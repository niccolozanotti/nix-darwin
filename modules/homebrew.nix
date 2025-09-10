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
    ];
    casks = [
      "bitwarden" #desktop
      # Terminal
      "wezterm"
      "visual-studio-code"
      # Notes/Research
      "obsidian"
      "zotero"
      # Window tiling manager
      "rectangle"
      "zoom"
      "slack"
      # Microsoft sh t
      "microsoft-word"
      "microsoft-excel"
      "microsoft-teams"
      # LLMS
      "claude"
      "whatsapp"
      # VPN
      "nordvpn"
      # Browsers
      "brave-browser"
      "librewolf"
      "tor-browser"
      "proton-pass"
      # email
      "proton-mail-bridge"
      "thunderbird"
      # Containers
      "docker-desktop"
      # Cloud
      "megasync"
      # OS image
      "balenaetcher"
      "raspberry-pi-imager"
    ];
    masApps = {
      # Add Mac App Store apps here
      "Flighty" = 1358823008;
      "Wireguard" = 1451685025;
      # "myUniBo" = 1468069187; # not working: from iPhone App Store
    };
    # onActivation.cleanup = "zap";
  };
}
