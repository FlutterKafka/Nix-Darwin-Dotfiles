{pkgs, lib, ...}: {
  imports = [
    ./home-manager.nix
    ../modules/yabai
  ];

  documentation.enable = false;
  environment.systemPackages = [pkgs.git];

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    caskArgs = {
      appdir = "~/Applications";
      require_sha = true;
    };
    casks = [
      "anki"
      "android-studio"
      "mullvad-browser"
    ];
  };

  networking = {
    applicationFirewall = {
      enable = true;
      enableStealthMode = true;
    };
  };

  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = lib.mkDefault "aarch64-darwin";
  };
  nix = {
    package = pkgs.lix;
    optimise.automatic = true;
    settings.experimental-features = ["nix-command" "flakes"];
  };

  users.users.kafka = {
    home = "/Users/kafka";
    shell = pkgs.fish;
  };

  programs.fish.enable = true;

  security.pam.services.sudo_local.touchIdAuth = true;

  system = {
    stateVersion = lib.mkDefault 5;
    primaryUser = "kafka";
    defaults = {
      dock = {
        autohide = true;
        orientation = "left";
        tilesize = 48;
        mru-spaces = false;
        show-recents = false;
      };
      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        _FXSortFoldersFirst = true;
        FXPreferredViewStyle = "clmv";
        ShowPathbar = true;
        ShowStatusBar = true;
      };
      trackpad = {
        Clicking = true;
        Dragging = true;
        TrackpadThreeFingerDrag = true;
        TrackpadThreeFingerTapGesture = 0;
      };
      loginwindow = {
        GuestEnabled = false;
        DisableConsoleAccess = true;
      };
      SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        AppleShowScrollBars = "WhenScrolling";
      };
    };
  };
}
