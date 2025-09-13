{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    # nixpkgs.url = "github:NixOS/nixpkgs/8fd2103ed89873b2dc769030f955a88e1e42afde";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    homa = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rofi-music.url = "github:FlutterKafka/Rofi-Music";
  };
  outputs = inputs: {
    darwinConfigurations = {
      kafka = inputs.nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = {inherit inputs;};
        modules = [./nixos/configuration.nix];
      };
    };
  };
}
