{pkgs, ...}: {
  home.packages = [pkgs.jetbrains-mono];
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    package = pkgs.ghostty-bin;
    themes = {
      everforest-dark-soft = {
        palette = [
          "0=#4b565c"
          "1=#e67e80"
          "2=#a7c080"
          "3=#dbbc7f"
          "4=#7fbbb3"
          "5=#d699b6"
          "6=#83c092"
          "7=#d3c6aa"
          "8=#4b565c"
          "9=#e67e80"
          "10=#a7c080"
          "11=#dbbc7f"
          "12=#7fbbb3"
          "13=#d699b6"
          "14=#83c092"
          "15=#d3c6aa"
        ];
        background = "323d43";
        foreground = "d3c6aa";
        selection-foreground = "323d43";
        selection-background = "d3c6aa";
      };
    };
    settings = {
      theme = "everforest-dark-soft";
      font-family = "JetBrains Mono";
      font-style = "SemiBold";
      font-size = 14;
      command = "/etc/profiles/per-user/kafka/bin/fish";
      cursor-style = "bar";
      cursor-style-blink = "false";
      cursor-color = "#ffffff";
      confirm-close-surface = false;
      window-theme = "system";
      macos-option-as-alt = true;
      quit-after-last-window-closed = true;
      macos-non-native-fullscreen = true;
      macos-titlebar-style = "native";
      macos-auto-secure-input = true;
      macos-secure-input-indication = true;
    };
  };
}
