{ config, pkgs, inputs, ... }:
{
  programs.tmux = {
    enable = true;
    # enable = false;
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      resurrect
      continuum
      # power-theme
    ];
    extraConfig = ''
      ${builtins.readFile ./tmux.conf}
    '';
  };
}
