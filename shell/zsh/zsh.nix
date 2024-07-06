{
  programs.zsh = {
    enable = true;
    antidote = {
      enable = true;
      useFriendlyNames = true;
      plugins = [
        "zsh-users/zsh-autosuggestions"
        "Aloxaf/fzf-tab"
        "MichaelAquilina/zsh-you-should-use"
        "zdharma-continuum/fast-syntax-highlighting"
        "joshskidmore/zsh-fzf-history-search"
        "zsh-users/zsh-history-substring-search"
      ];
    };
    autosuggestion.enable = true;
    # zsh-autoenv.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    initExtra = ''
      WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
      source /home/ari/.config/nix-config/home-manager/shell/zsh/fzf2nvim.sh
      source /home/ari/.config/nix-config/home-manager/shell/zsh/functions.sh
      source /home/ari/.config/nix-config/home-manager/shell/zsh/tmux_choose.sh
      bindkey "^E" forward-word
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word

      # Control + Backspace Setting
      bindkey '^H' backward-kill-word
      bindkey '^B' backward-kill-word

      bindkey '^[[A' up-line-or-search                                                
      bindkey '^[[B' down-line-or-search

      # Shift-Tab
      bindkey '^[[Z' autosuggest-accept

      # interupt sig
      stty intr ^P

      # Copy whole command
      cmd_to_clip () { wl-copy -n <<< $BUFFER }
      zle -N cmd_to_clip
      bindkey '^Y' cmd_to_clip

      # map ctrl+c  copy_to_clipboard # in kitty.conf
      bindkey '^K' clear-screen
      bindkey '^U' clear-screen
    '';
    shellGlobalAliases = {
      c="zoxide";
      n="nvim";
      sz="source ~/.zshrc";
      l="ranger";
      hi="systemctl hibernate";
      ss="systemctl poweroff";
      rb="systemctl reboot";
      # nib="sudo nixos-rebuild build --flake /etc/nixos/";
      nib="nixos-rebuild build --flake /home/ari/.config/nix-config/nixos/";
      # nis="sudo nixos-rebuild switch --flake /etc/nixos/";
      nis="sudo nixos-rebuild switch --flake /home/ari/.config/nix-config/nixos/";
      ec="nvim /home/ari/.config/nix-config/nixos/configuration.nix";
      # ec="sudoedit /home/ari/.config/nix-config/nixos/configuration.nix";
      bt="bluetoothctl";
      br="brightnessctl";
      hy="nvim ~/.config/hypr/hyprland.conf";
      gl="nvim ~/Code/zmk-linux-build-script/urob-zmk-config/config/my.keymap";
      se="sudoedit";
      h="nvim /home/ari/.config/nix-config/home-manager/home.nix";
      hs="home-manager switch --flake /home/ari/.config/nix-config/home-manager/";
      ba="nvim ~/.bash_history ";
      lout="hyprctl dispatch exit";
      ubu="/home/ari/Code/zmk-linux-build-script/urob-zmk-config/scripts/zmk_build.sh";
      ud="upower -d";
      sof="sleep 1 && hyprctl dispatch dpms off";
      son="hyprctl dispatch dpms on";
      nz="nvim ~/.config/nix-config/home-manager/shell/zsh.nix";
      mk="mkdir";  
      ll="lsd -l"; 
      la="lsd -la";
      t="touch";
      cs="tmux_choose_session";
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
