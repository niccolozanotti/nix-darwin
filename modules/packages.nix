{ pkgs, ... }: {

  # Allow non open-source packages
  nixpkgs.config.allowUnfree = true;

  # Override packages to use an older C standard for compatibility
  nixpkgs.overlays = [
    (final: prev: {
      abook = prev.abook.overrideAttrs (oldAttrs: {
        NIX_CFLAGS_COMPILE = (oldAttrs.NIX_CFLAGS_COMPILE or "") + " -std=gnu17";
      });
      dante = prev.dante.overrideAttrs (oldAttrs: {
        NIX_CFLAGS_COMPILE = (oldAttrs.NIX_CFLAGS_COMPILE or "") + " -std=gnu17";
      });
    })
  ];

  environment.systemPackages = [
    # GPG/SSH
    pkgs.openssh
    pkgs.sshpass
    pkgs.expect
    pkgs.gnupg
    pkgs.pinentry_mac
    # git
    pkgs.git
    pkgs.git-lfs
    pkgs.lazygit
    # Shell
    pkgs.fzf
    pkgs.starship
    pkgs.zsh-syntax-highlighting
    pkgs.zsh-autosuggestions
    pkgs.zsh-fzf-tab
    # Vim/Neovim (with dependies for nvim distro)
    pkgs.vim
    pkgs.emacs
    # pkgs.neovim # in favor of nightly build
    pkgs.ripgrep
    # C/C++/Fortran compiler toolchain
    pkgs.gcc14
    pkgs.gfortran14
    pkgs.gnumake
    pkgs.cmake
    pkgs.openblas
    # Zig
    pkgs.zig
    # go
    pkgs.go
    # julia
    pkgs.julia-bin
    # minizinc
    pkgs.minizinc
    # R and packages
    pkgs.R
    # python
    pkgs.python313
    pkgs.uv
    pkgs.ty
    # lua
    pkgs.lua
    # Language Servers (used in nvim)
    # Fortran
    pkgs.fortls
    # CMake
    pkgs.cmake-language-server
    # Lua
    pkgs.lua-language-server
    # Python
    pkgs.pyright
    # Zig
    pkgs.zls
    # Typst
    pkgs.tinymist
    # Bash with deps
    pkgs.bash-language-server
    pkgs.shellcheck
    pkgs.shfmt
    # Terminal/multiplexer
    pkgs.xterm
    pkgs.tmux
    # cli password manager
    pkgs.pass
    pkgs.gopass
    # email (neomutt + deps)
    pkgs.neomutt
    # abook with overlay
    pkgs.notmuch
    pkgs.lynx
    pkgs.isync
    pkgs.msmtp
    # email client for code reviews
    pkgs.aerc
    # Graph visualization tools
    pkgs.graphviz
    # AI tools
    pkgs.opencode
    pkgs.codex
    # .md, .qmd notes/notebooks
    pkgs.quarto
    # Typesetting programs
    pkgs.typst
    pkgs.texliveFull
    # Computer statistics utilities
    # pkgs.mactop
		(pkgs.mactop.overrideAttrs (old: {
      doCheck = false;
    }))
    pkgs.fastfetch
    # Research/citations
    pkgs.zotero
    # VPN
    pkgs.wireguard-tools
    pkgs.openvpn
    # Syncing
    pkgs.syncthing
    # Static website generator
    pkgs.hugo
    # Dart SASS (hugo chicago7 theme)
    pkgs.dart-sass
    # sr.ht cli
    pkgs.hut
    # firmware/embedded
    pkgs.dfu-util
    # image/video handling
    pkgs.ffmpeg
    # encrypted backup
    # speedtest
    pkgs.ookla-speedtest
    pkgs.rclone
    # shell utilities
    pkgs.tree
    pkgs.wget
    pkgs.scc
    pkgs.btop
    pkgs.cloudflared
  ];
}
