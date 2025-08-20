{pkgs, ...}: {
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
    packages = with pkgs; [ keepassxc libreoffice-bin utm
      colima
      docker
      docker-compose
      docker-credential-helpers
    ];
  };

  manual.manpages.enable = false;
  programs = {
    man.enable = false;
    home-manager.enable = true;
  };
}
