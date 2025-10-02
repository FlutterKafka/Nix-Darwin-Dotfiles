{
  imports = [
    ./modules/fish
    ./modules/ghostty
    ./modules/helix
    ./modules/mpv
    ./modules/skhd
    ./modules/starship
  ];

  home = {
    username = "kafka";
    homeDirectory = "/Users/kafka";
    stateVersion = "23.11";
  };

  manual.manpages.enable = false;
  programs = {
    man.enable = false;
    home-manager.enable = true;
  };
}
