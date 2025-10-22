{pkgs, ...}: {
  home.packages = with pkgs; [nyaa transmission_4 yt-dlp];
  programs.mpv = {
    enable = true;
    scripts = with pkgs; [
      mpvScripts.modernx-zydezu
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
        speed = 2;
        cache = true;
        demuxer-readahead-secs = 30;
        demuxer-max-bytes = "512MiB";
        demuxer-max-back-bytes = "128MiB";
        script-opts-append = "ytdl_hook-ytdl_path=yt-dlp";
        ytdl-format = "bestvideo[height=?480][vcodec=vp9]+bestaudio/best";
      };
    };
    bindings = {
      c = ''cycle_values sub-ass-override "force" "no"'';
    };
  };
}
