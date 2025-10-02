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

      rcmd - t : open -na 'Ghostty'
      rcmd - e : osascript -e 'tell application "Finder" to make new Finder window to home'
      rcmd - a : open -na 'Mullvad Browser'
      rcmd - k : open -na 'KeePassXC'
      rcmd - l : open -na 'LibreOffice'
      rcmd - v : open -na 'VSCodium'
    '';
  };
}
