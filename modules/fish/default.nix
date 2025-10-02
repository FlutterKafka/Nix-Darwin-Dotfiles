{pkgs, ...}: {
  home.packages = with pkgs; [eza fzf gnupg zoxide];
  programs.fish = {
    enable = true;
    shellAliases = {
      # Core Utils
      cd = "z";
      ls = "eza -la --group-directories-first";
      # Git aliases
      g = "git";
      gi = "git status";
      go = "git commit -S -a -m";
      gp = "git push -u origin";
      # Editor
      edit = "hx ~/.config/nix/";
      # System
      chalk = "cd ~/.config/nix && sudo darwin-rebuild check --flake .#kafka";
      swatch = "cd ~/.config/nix && sudo darwin-rebuild switch --flake .#kafka";
      clean = "brew cleanup && sudo nix-collect-garbage && nix-collect-garbage -d";
      update = "brew upgrade --greedy && cd ~/.config/nix/ && sudo nix flake update";
    };
    interactiveShellInit = ''
      set fish_greeting
      zoxide init fish | source
      starship init fish | source
      fish_config theme choose "Rosé Pine"
      set -Ux HOMEBREW_NO_ANALYTICS 1
      set -Ux HOMEBREW_NO_ENV_HINTS 1
      set -Ux HOMEBREW_NO_INSECURE_REDIRECT 1
      fish_add_path /opt/homebrew/bin
      fish_add_path /Users/kafka/.local/bin
      fish_add_path /opt/homebrew/opt/ruby/bin
      fish_add_path ~/Documents/development/flutter/bin
    '';
  };
}
