{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    extraConfig = ''
      # See https://wiki.hyprland.org/Configuring/Monitors/
      monitor=,highres,auto,1


      # See https://wiki.hyprland.org/Configuring/Keywords/ for more

      # Execute your favorite apps at launch
      # Windows
      exec-once = [workspace 4 silent] pavucontrol 
      exec-once = [workspace 3 silent] kitty
      exec-once = [workspace 2 silent] chromium
      exec-once = [workspace 1 silent] obsidian
      # Background apps
      exec-once = wl-paste --watch cliphist store
      exec-once = udiskie
      exec-once = hyprpaper
      # Source a file (multi-file configs)
      # source = ~/.config/hypr/myColors.conf
      
      # Some default env vars.
      #
      env = XCURSOR_SIZE,24
      
      # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
      input {
          kb_layout = us
          kb_variant =
          kb_model =
          kb_options =
          kb_rules =
      
          follow_mouse = 1
      
          touchpad {
              natural_scroll = no
          }
      
          sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
      }
      
      general {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
      
          gaps_in = 0
          gaps_out = 0
          border_size = 1
          col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
          col.inactive_border = rgba(595959aa)
      
          layout = dwindle
      
          # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
          allow_tearing = false
      }
      
      decoration {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
      
          rounding = 5
         
          blur {
              enabled = true
              size = 3
              passes = 1
          }
      
          drop_shadow = yes
          shadow_range = 4
          shadow_render_power = 3
          col.shadow = rgba(1a1a1aee)
      }
      
      animations {
          enabled = yes
          # enabled = no
      
          # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
      
          bezier = myBezier, 0, 0.9, 0.1, 1.05
          # bezier = myBezier, 0.5, 0.9, 0.1, 1.05
      
          animation = windows, 1, 7, myBezier
          animation = windowsOut, 1, 7, default, popin 80%
          animation = border, 1, 10, default
          animation = borderangle, 1, 8, default
          animation = fade, 1, 7, default
          animation = workspaces, 1, 6, default
      }
      
      dwindle {
          # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
          pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = yes # you probably want this
      }
      
      master {
          # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
          new_is_master = true
      }
      
      gestures {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          workspace_swipe = on
      }
      
      misc {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          force_default_wallpaper = -1 # Set to 0 to disable the anime mascot wallpapers
          disable_hyprland_logo = true
          disable_splash_rendering = true
      }
      
      # Example per-device config
      # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
      device:epic-mouse-v1 {
          sensitivity = -0.5
      }
      
      # Example windowrule v1
      # windowrule = float, ^(kitty)$
      # Example windowrule v2
      # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
      # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
      
      
      # See https://wiki.hyprland.org/Configuring/Keywords/ for more
      $mainMod = SUPER
      $mod = SUPER
      
      # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
      bind = $mainMod, A, exec, kitty
      bind = $mainMod, C, killactive, 
      bind = $mainMod SHIFT, M, exit, 
      # bind = $mainMod, E, exec, dolphin
      bind = $mainMod, V, togglefloating, 
      # bind = $mainMod, R, exec, wofi --show drun
      # bind = $mainMod, P, pseudo, # dwindle
      bind = $mainMod, J, togglesplit, # dwindle
      # bind = $mod, Q, layoutmsg, cycleprev
      # bind = $mod, W, layoutmsg, cyclenext
      bind = $mod, F, fullscreen, 1
      # bind = $mod, F, fakefullscreen
      # bind = $mod, F, fullscreen
      bind=SUPER,PERIOD,workspace,previous
      bind = $mainMod, RETURN, swapnext
      bind = $mainMod, O, toggleopaque
      
      # Move focus with mainMod + arrow keys
      bind = $mainMod, Q, movefocus, l
      bind = $mainMod, W, movefocus, r
      bind = $mainMod, up, movefocus, u
      bind = $mainMod, down, movefocus, d
      
      # Switch workspaces with mainMod + [0-9]
      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10
      
      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9
      bind = $mainMod SHIFT, 0, movetoworkspace, 10
      
      # Example special workspace (scratchpad)
      bind = $mainMod, E, togglespecialworkspace, magic
      bind = $mainMod SHIFT, E, fakefullscreen
      bind = $mainMod SHIFT, E, movetoworkspace, special:magic
      
      # Scroll through existing workspaces with mainMod + scroll
      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1
      
      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow
      
      bind = SUPER, D, workspace, e+1
      bind = SUPER, S, workspace, e-1
      
      # windowrule = workspace 1, ^(.*obsidian.*)$
      # windowrule = workspace 2, ^(.*chromium-browser.*)$
      # windowrule = workspace 3, ^(.*kitty.*)$
      # windowrule = workspace 4, ^(.*Spotify.*)$
      #
      bind = $mod, Y, exec, rofi -show drun
      bind = $mod, R, exec, rofi -show drun
      bind = $mod, Z, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy
      bind = $mod, P, exec, playerctl play-pause
      bind = $mod ALT, P, exec, playerctl next
      # Screenshot to Obsidian
      bind = $mod SHIFT, S, exec, wayshot -s "$(slurp)" -f /home/ari/Information/FILES/OBSIDIAN/_\ Files/Obsidian\ Screenshot\ Files/"$(date +%y-%m-%d_%H-%M-%S).png" 
      # Media Control
      bind = $mod SHIFT ALT, Q, exec, playerctl position 5-
      bind = $mod SHIFT ALT, W, exec, playerctl position 5+
      # Volume Control
      bind = , XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%
      bind = , XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%
      # Misc
      bind = $mod, B, exec, bemoji -cn
      
      # Picture In Picture
      windowrulev2 = float, title:^(Picture in picture)$
      # windowrulev2 = pin, title:^(Picture in picture)$
      windowrulev2 = size 25% 25%, title:^(Picture in picture)$
      windowrulev2 = move 75% 0%, title:^(Picture in picture)$
      windowrulev2 = nofocus, title:^(Picture in picture)$
      windowrulev2 = move 41% 26%, title:^(JetBrains Toolbox)$
      windowrulev2 = move 41% 26%, title:^(com-jetbrains-toolbox-entry-ToolboxEntry)$
      # windowrulev2 = , special:magic, title:^(Picture in picture)$
      # windowrulev2 = fakefullscreen, class:special:magic
    '';
  };
}
