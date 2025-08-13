{
  programs.starship = {
    enable = true;
    settings = {
      format = "[ ](purple)$username$hostname in $directory$git_branch$git_state$git_status$cmd_duration$character";
      character = {
        success_symbol = "[❯](bold purple)";
        error_symbol = "[❯](bold red)";
      };
      username = {
        show_always = true;
        style_root = "bold red";
        style_user = "bold purple";
        format = "[$user]($style)@";
      };
      hostname = {
        ssh_only = false;
        trim_at = ".";
        format = "[$hostname](bold blue)";
      };
      directory = {
        read_only = "§";
        truncation_length = 3;
        truncate_to_repo = true;
        style = "bold italic purple";
      };
      cmd_duration = {
        min_time = 3000;
        show_milliseconds = false;
        style = "bold italic blue";
      };
    };
  };
}
