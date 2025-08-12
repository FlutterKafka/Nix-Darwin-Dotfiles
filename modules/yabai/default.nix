{
  services.yabai = {
    enable = true;
    enableScriptingAddition = false;
    config = {
      layout = "bsp";
      window_placement = "second_child";
      top_padding = 8;
      bottom_padding = 8;
      left_padding = 8;
      right_padding = 8;
      window_gap = 20;
      auto_balance = false;
      split_ratio = "0.5";
      mouse_modifier = "cmd";
      mouse_action1 = "move";
      mouse_action2 = "resize";
      focus_follows_mouse = "autofocus";
      mouse_follows_focus = false;
      window_shadow = false;
      window_opacity = true;
      active_window_opacity = 1.0;
      normal_window_opacity = 0.9;
    };
    extraConfig = ''
      yabai -m rule --add app='System Preferences' manage=off
      yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"
      sudo yabai --load-sa
    '';
  };
}
