{pkgs, lib, ...}: {
  home.packages = with pkgs; [cocoapods ruby vscodium vscode];
  programs.helix = {
    enable = true;
    settings = {
      theme = "everforest_dark";
      editor = {
        color-modes = true;
        completion-trigger-len = 1;
        completion-replace = true;
        cursorline = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        indent-guides.render = true;
        inline-diagnostics = {
          cursor-line = "hint";
          other-lines = "error";
        };
        lsp.display-inlay-hints = true;
        soft-wrap.enable = true;
        statusline.center = ["position-percentage"];
        true-color = true;
        trim-final-newlines = true;
        trim-trailing-whitespace = true;
        whitespace.characters = {
          newline = "↴";
          tab = "⇥";
        };
      };
      keys = {
        normal = {
          e = "move_next_word_start";
          w = "move_prev_word_start";
          b = "move_next_word_end";
        };
      };
    };
    languages = {
      language-server = {
        nil = {
          command = lib.getExe pkgs.nil;
          config.nil.formatting.command = ["${lib.getExe pkgs.alejandra}" "-q"];
        };
      };
    };
  };
}
