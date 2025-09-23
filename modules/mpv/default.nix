{pkgs, ...}: {
  home.packages = with pkgs; [choose-gui terminal-notifier];
  programs.mpv = {
    enable = true;
    scripts = with pkgs; [
      mpvScripts.modernx
      mpvScripts.evafast
      mpvScripts.thumbfast
    ];
    config = {
      profile = "high-quality";
      vo = "gpu-next";
      scale-antiring = "0.6";

      dither-depth = 8;

      osc = false;
      osd-bar = false;
      border = false;
      ontop = true;
      keep-open = true;

      screenshot-format = "png";
      screenshot-dir = "~/Pictures/mpv";
      screenshot-template = "%F-%p-%n";
      screenshot-high-bit-depth = false;

      slang = "enm, eng, en";
      alang = "jpn, ja";

      sub-ass-override = false;
      sub-ass-style-overrides = "playresx=1920, playresy=1080";
      sub-font = "Gandhi Sans";
      sub-font-size = 50;
      sub-color = "#FFFFFF";
      sub-margin-y = 40;
      sub-border-size = "2.4";
      sub-border-color = "#FF000000";
      sub-shadow-color = "#A0000000";
      sub-shadow-offset = "0.75";
      sub-bold = true;
    };
    profiles = {
      crunchyroll = {
        profile-cond = ''filename:match("SubsPlease") or filename:match("Erai%-raws") or filename:match("HorribleSubs")'';
        profile-restore = "copy";
        sub-ass-use-video-data = "aspect-ratio";
      };
      simulcast = {
        profile-cond = ''(function(a)for b,c in ipairs(a)do if filename:match(c)then return true end end end)({"SubsPlease","Erai%-raws","Tsundere%-Raws","%-VARYG","HorribleSubs","SubsPlus%+", "Yameii"})'';
        profile-restore = "copy";
        deband = true;
      };
      "protocol.https" = {
        volume = 60;
      };
      "extension.m4a" = {
        volume = 60;
      };
    };
    bindings = {
      c = ''cycle_values sub-ass-override "force" "no"'';
    };
  };
}
