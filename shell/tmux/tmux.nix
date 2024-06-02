{
  programs.tmux = {
    enable = true;
    # enable = false;
    extraConfig = ''
      ${builtins.readFile ./tmux.conf}
    '';
  };
}
