{ pkgs, ... }: {

  # vars used in shell config file (.zshrc, ...)
  environment.variables =
  {
    ZSH_FZF_TAB_ROOT = "${pkgs.zsh-fzf-tab}";
    ZSH_SYNTAX_HIGHLIGHTING_ROOT = "${pkgs.zsh-syntax-highlighting}";
    ZSH_AUTOSUGGESTIONS_ROOT = "${pkgs.zsh-autosuggestions}";
  };
  programs.bash = {
    enable = true;
    interactiveShellInit = ''
      PS1='\h:\W \u\$ '
      shopt -s checkwinsize
    '';
  };

  programs.zsh = {
    enable = true;
    shellInit = ''
      if [[ "$(locale LC_CTYPE)" == "UTF-8" ]]; then
          setopt COMBINING_CHARS
      fi
      disable log
      HISTFILE=''${ZDOTDIR:-$HOME}/.zsh_history
      HISTSIZE=2000
      SAVEHIST=1000
      setopt BEEP
    '';
    enableFzfCompletion = true;
    enableFzfGit = true;
    enableFzfHistory = true;
  };
}
