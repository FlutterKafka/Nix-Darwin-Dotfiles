{
  programs.fish = {
    enable = true;
    shellAliases = {
      # Core Utils
      cd = "z";
      ls = "eza -al --group-directories-first";
      # Editor
      mako = "hx ~/.config/nix/";
      # Media
      nyaa = "fastanime anilist";
      # System
      neko = "cd ~/.config/nix && sudo darwin-rebuild switch --flake .#kafka";
      sora = "brew cleanup && sudo nix-collect-garbage && nix-collect-garbage -d";
      kage = "brew upgrade --greedy && cd ~/.config/nix/ && sudo nix flake update";
    };
    interactiveShellInit = ''
      set fish_greeting
      starship init fish | source
      zoxide init fish | source
      fish_config theme choose "Rosé Pine"
      set -Ux HOMEBREW_NO_ANALYTICS 1
      set -Ux HOMEBREW_NO_ENV_HINTS 1
      set -Ux HOMEBREW_NO_INSECURE_REDIRECT 1
      fish_add_path ~/flutter/bin
      fish_add_path /opt/homebrew/bin
      fish_add_path /Users/kafka/.local/bin
      fish_add_path /opt/homebrew/opt/ruby/bin
    '';
  };
}
