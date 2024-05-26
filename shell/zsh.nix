{
  programs.zsh = {
    enable = true;
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
        { name = "Aloxaf/fzf-tab"; } # Simple plugin installation
        { name = "MichaelAquilina/zsh-you-should-use"; } # Simple plugin installation
        { name = "zdharma-continuum/fast-syntax-highlighting"; } # Simple plugin installation
# https://github.com/joshskidmore/zsh-fzf-history-search
        { name = "joshskidmore/zsh-fzf-history-search"; }
      ];
    };
    autosuggestion.enable = true;
    # zsh-autoenv.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    initExtra = ''
      source ~/fzf2nvim.sh
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
      bindkey '^H' backward-kill-word
      bindkey '^[[A' up-line-or-search                                                
      bindkey '^[[B' down-line-or-search
      # s+tab
      bindkey '^[[Z' autosuggest-accept
      # interupt sig
      stty intr ^P
      # copy
      # Copy whole command
      cmd_to_clip () { wl-copy -n <<< $BUFFER }
      zle -N cmd_to_clip
      bindkey '^Y' cmd_to_clip
      # map ctrl+c  copy_to_clipboard # in kitty.conf
    '';
    shellGlobalAliases = {
      c="zoxide";
      h="cd ~";
      n="nvim";
      nb="nvim ~/.bashrc";
      sz="source ~/.zshrc";
      l="ranger";
      hi="systemctl hibernate";
      ss="systemctl poweroff";
      rb="systemctl reboot";
      # nib="sudo nixos-rebuild build --flake /etc/nixos/";
      nib="nixos-rebuild build --flake /home/ari/.config/nix-config/nixos/";
      # nis="sudo nixos-rebuild switch --flake /etc/nixos/";
      nis="nixos-rebuild switch --flake /home/ari/.config/nix-config/nixos/";
      ec="nvim /home/ari/.config/nix-config/nixos/configuration.nix";
      # ec="sudoedit /home/ari/.config/nix-config/nixos/configuration.nix";
      bt="bluetoothctl";
      br="brightnessctl";
      hy="nvim ~/.config/hypr/hyprland.conf";
      gl="nvim ~/Code/zmk-linux-build-script/urob-zmk-config/config/my.keymap";
      se="sudoedit";
      ho="nvim /home/ari/.config/nix-config/home-manager/home.nix";
      hos="home-manager switch --flake /home/ari/.config/nix-config/home-manager/";
      ba="nvim ~/.bash_history ";
      lout="hyprctl dispatch exit";
      ubu="/home/ari/Code/zmk-linux-build-script/urob-zmk-config/scripts/zmk_build.sh";
      ud="upower -d";
      sof="sleep 1 && hyprctl dispatch dpms off";
      son="hyprctl dispatch dpms on";
      nz="nvim ~/.config/nix-config/home-manager/shell/zsh.nix";
      mk="mkdir";  
      ll="lsd -l"; 
      lla="lsd -la";
      t="touch";
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
