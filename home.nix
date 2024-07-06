{ config, pkgs, lib, inputs, ... }:
let
in 
{
  imports = [
    ./shell/zsh/zsh.nix
    ./shell/starship.nix
    ./shell/tmux/tmux.nix
    ./desktop/nvim/nvim.nix
    #./desktop/hyprland.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ari";
  home.homeDirectory = "/home/ari";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.
  
  nixpkgs.config.allowUnfree = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.vscode
    pkgs.jdk17
    pkgs.swayidle
    pkgs.davinci-resolve-studio
    pkgs.hello
    pkgs.hyprpaper
    pkgs.eww
    pkgs.bat
    pkgs.eza
    pkgs.ytfzf
    pkgs.ueberzugpp
    pkgs.bemoji
    pkgs.zinit
    pkgs.element-desktop
    pkgs.hyprpicker
    # pkgs.nvim-pkg
    pkgs.vimPlugins.nvchad
    pkgs.ncdu
    # android-studio......
    pkgs.android-studio
    pkgs.libpng
    #
    pkgs.jetbrains.idea-community
    pkgs.unzip
    pkgs.mediainfo
    pkgs.obs-studio
    pkgs.gh
    pkgs.foot
    pkgs.nodejs_20
    pkgs.qpwgraph
    pkgs.mpv
    pkgs.ffmpeg
    pkgs.discord
    pkgs.htop
    pkgs.yt-dlp

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];
  home.extraProfileCommands = ''
   ln -s ${pkgs.jdk17}/bin/java $out/bin/java17
  '';
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/ari/etc/profile.d/hm-session-vars.sh
  #
  programs.git = {
    enable = true;
    userName = "arilebedey";
    userEmail = "34816154+arilebedey@users.noreply.github.com";
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos/";
    };
  };

  programs.zathura = {
    enable = true;
    extraConfig = ''
      set guioptions none
    '';
  };

  programs.zoxide.enableZshIntegration = true;
  programs.zoxide.enable = true;

  gtk.enable = true;
  qt.enable = true;

  programs.kitty = {
    enable = true;
    font.name = "Hack";
    font.size = 22;
    extraConfig = ''
      # vim:fileencoding=utf-8:foldmethod=marker
      enable_audio_bell no

      # MAPPINGS
      map ctrl+c  copy_to_clipboard

      # THEME
      include Batman.conf
      cursor_blink_interval 0
    '';
  };

  xdg.desktopEntries.davinci-resolve-studio = {
    name = "Davinci Resolve Studio";
    # desktopName = "resolve";
    prefersNonDefaultGPU = true;
    exec = "davinci-resolve-studio %u";
    # exec = "QT_SCALE_FACTOR=1.5 DRI_PRIME=1 davinci-resolve-studio %u";
    terminal = false;
    type = "Application";
    icon = "/home/ari/Downloads/DaVinci_Resolve_Studio.png";
    # mimeTypes="x-scheme-handler/x-resolveproj";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
