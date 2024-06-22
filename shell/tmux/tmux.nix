{ config, pkgs, inputs, ... }:
{
  programs.tmux = {
    enable = true;
    # enable = false;
    extraConfig = ''
      ${builtins.readFile ./tmux.conf}
    '';
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
    ];
  };

  # home.packages = with pkgs; [
  #   tmuxPlugins.  ];
}
