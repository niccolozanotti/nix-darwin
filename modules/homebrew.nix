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
      # sshfs mount from remote server
      "macfuse"
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
      "whatsapp"
      "telegram"
      # VPN
      "nordvpn"
      # Browsers
      "brave-browser"
      "librewolf"
      "tor-browser"
      # email
      "proton-mail-bridge"
      "docker-desktop"
      # Cloud
      "megasync"
      # OS image
      "balenaetcher"
      "raspberry-pi-imager"
      # OpenVPN client
      "tunnelblick"
    ];
    masApps = {
      # Add Mac App Store apps here
      "Flighty" = 1358823008;
      "Wireguard" = 1451685025;
      "HP" = 1474276998;
      "Xcode" = 497799835;
      # "myUniBo" = 1468069187; # not working: from iPhone App Store
      ## Proton Authenticator still not packaged
    };
    # onActivation.cleanup = "zap";
  };
}
