{ pkgs, ... }: {

  # Allow non open-source packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = [
    # GPG/SSH
    pkgs.openssh
    pkgs.gnupg
    pkgs.pinentry_mac
    # git
    pkgs.git
    pkgs.lazygit
    # Shell
    pkgs.fzf
    pkgs.starship
    pkgs.zsh-syntax-highlighting
    pkgs.zsh-autosuggestions
    pkgs.zsh-fzf-tab
    # Vim/Neovim (with dependies for nvim distro)
    pkgs.vim
    pkgs.neovim
    pkgs.ripgrep
    # C/C++/Fortran compiler toolchain
    pkgs.gcc14
    pkgs.gfortran14
    pkgs.gnumake
    pkgs.cmake
    pkgs.fortran-fpm
    # Zig
    pkgs.zig
    # go
    pkgs.go
    # python
    pkgs.python313
    pkgs.uv
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
    # email
    pkgs.neomutt
    pkgs.abook
    pkgs.notmuch
    pkgs.lynx
    pkgs.isync
    pkgs.msmtp
    # Graph visualization tools
    pkgs.graphviz
    # Local LLM inference interface
    pkgs.ollama
    # .md, .qmd notes/notebooks
    pkgs.quarto
    # Typesetting programs
    pkgs.typst
    pkgs.texliveSmall #if needed _Medium,_Full
    # Computer statistics utilities
    pkgs.mactop
    pkgs.fastfetch
    # Research/citations
    pkgs.zotero
    # VPN
    pkgs.wireguard-tools
    # Syncing
    pkgs.syncthing
    # Static website generator
    pkgs.hugo
    # sr.ht cli
    pkgs.hut
    # Useful cmds
    pkgs.tree
    pkgs.wget
    pkgs.scc
  ];
}
