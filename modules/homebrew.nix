{ ... }: {
  homebrew = {
    enable = true;
    brews = [
      "urlview"
    ];
    casks = [
      "microsoft-word"
      "microsoft-excel"
      "claude"
      "whatsapp"
      "nordvpn"
      "docker-desktop"
      "megasync"
      "passepartout"
      "balenaetcher"
      "raspberry-pi-imager"
    ];
    masApps = {
      # Add Mac App Store apps here
      "Flighty" = 1358823008;
      # "myUniBo" = 1468069187; # not working: from iPhone App Store
    };
    # onActivation.cleanup = "zap";
  };
}
