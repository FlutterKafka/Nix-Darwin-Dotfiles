{
  services.skhd = {
    enable = true;
    config = ''
      cmd - p : yabai -m window --toggle float --toggle sticky --grid 4:4:1:1:2:2
      cmd - g : yabai -m window --toggle zoom-parent
      cmd - h : yabai -m window --toggle zoom-fullscreen
      cmd - j : yabai -m window --toggle split

      shift + cmd - l : yabai -m space --balance

      cmd - left  : yabai -m window --focus west
      cmd - right : yabai -m window --focus east
      cmd - up    : yabai -m window --focus north
      cmd - down  : yabai -m window --focus south

      shift + cmd - left  : yabai -m window --warp west
      shift + cmd - right : yabai -m window --warp east
      shift + cmd - up    : yabai -m window --warp north
      shift + cmd - down  : yabai -m window --warp south

      cmd - 1 : yabai -m space --focus 1
      cmd - 2 : yabai -m space --focus 2
      cmd - 3 : yabai -m space --focus 3
      cmd - 4 : yabai -m space --focus 4

      shift + cmd - 1 : yabai -m window --space 1
      shift + cmd - 2 : yabai -m window --space 2
      shift + cmd - 3 : yabai -m window --space 3
      shift + cmd - 4 : yabai -m window --space 4

      rcmd - t : open -na 'Ghostty'
      rcmd - a : open -na 'Mullvad Browser'
      rcmd - e : open -na 'iCloud Drive'
      rcmd - k : open -na 'KeePassXC'
      rcmd - l : open -na 'LibreOffice'
      rcmd - v : open -na 'VSCodium'
      rcmd - u : open -na 'UTM'
      rcmd - o : nix run github:FlutterKafka/Rofi-Music
    '';
  };
}
