{pkgs, ...}: {
  imports = [
    ./modules/fish
    ./modules/helix
    ./modules/kitty
    ./modules/mpv
    ./modules/skhd
    ./modules/starship
  ];

  home = {
    username = "kafka";
    homeDirectory = "/Users/kafka";
    stateVersion = "23.11";
    packages = with pkgs; [
      cocoapods
      choose-gui
      colima
      docker
      docker-compose
      docker-credential-helpers
      eza
      fzf
      gnupg
      keepassxc
      libreoffice-bin
      openssh
      pipx
      ruby
      terminal-notifier
      utm
      vscodium
      zoxide
    ];
  };

  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  programs = {
    man.enable = false;
    home-manager.enable = true;
    bash.shellOptions = ["-HISTFILE"];
  };
}
