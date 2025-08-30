{ pkgs, ... }: {
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
    interactiveShellInit = ''
      source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
      source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
    '';
  };
}
