{inputs, config, pkgs, lib, ...}: {
  imports = [
    ./home-manager.nix
    ../modules/borders
    ../modules/yabai
  ];

  documentation = {
    enable = false;
    doc.enable = false;
    man.enable = false;
    info.enable = false;
  };

  fonts.packages = [pkgs.jetbrains-mono];

  security.pam.services.sudo_local.touchIdAuth = true;

  users.users.kafka = {
    home = "/Users/kafka";
    shell = pkgs.fish;
  };

  programs.fish.enable = true;

  networking = {
    applicationFirewall = {
      enable = true;
      enableStealthMode = true;
    };
  };

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    caskArgs = {
      appdir = "~/Applications";
      require_sha = true;
    };
    casks = [
      "anki"
      "eve-launcher"
      "mullvad-browser"
      "mullvad-vpn@beta"
    ];
  };

  system = {
    stateVersion = lib.mkDefault 5;
    primaryUser = "kafka";
    defaults = {
      dock = {
        autohide = true;
        orientation = "left";
        showhidden = true;
        mineffect = "scale";
        launchanim = false;
        show-process-indicators = false;
        tilesize = 48;
        static-only = true;
        mru-spaces = false;
        show-recents = false;
      };
      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        CreateDesktop = false;
        _FXSortFoldersFirst = true;
        FXPreferredViewStyle = "clmv";
        FXRemoveOldTrashItems = true;
        _FXShowPosixPathInTitle = true;
        QuitMenuItem = true;
        ShowPathbar = true;
        ShowStatusBar = true;
      };
      trackpad = {
        Dragging = true;
        Clicking = true;
        TrackpadRightClick = true;
        FirstClickThreshold = 0;
        SecondClickThreshold = 0;
        TrackpadThreeFingerDrag = true;
        TrackpadThreeFingerTapGesture = 0;
      };
      loginwindow = {
        GuestEnabled = false;
        DisableConsoleAccess = true;
      };
      SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
      NSGlobalDomain = {
        _HIHideMenuBar = false;
        NSWindowResizeTime = 0.1;
        AppleInterfaceStyle = "Dark";
        AppleShowScrollBars = "WhenScrolling";
        AppleKeyboardUIMode = 3;
        AppleICUForce24HourTime = true;
        NSWindowShouldDragOnGesture = true;
        AppleScrollerPagingBehavior = true;
        # defaults write -g ApplePressAndHoldEnabled -bool false
      };
    };
  };

  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = lib.mkDefault "aarch64-darwin";
  };
  environment.systemPackages = [pkgs.git];
  nix = let
    flakeInputs = lib.filterAttrs (_: v: lib.isType "flake" v) inputs;
  in {
    package = pkgs.lix;
    registry = lib.mapAttrs (_: v: {flake = v;}) flakeInputs;
    nixPath = lib.mapAttrsToList (key: _: "${key}=flake:${key}") config.nix.registry;
    optimise.automatic = true;
    settings = {
      builders-use-substitutes = true;
      experimental-features = ["nix-command" "flakes"];
      trusted-users = ["root" "@admin"];
      substituters = ["https://cache.nixos.org?priority=10"];
      trusted-public-keys = ["cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="];
    };
  };
}
