# Search Engines:
# https://searx.be/?preferences=eJxtVcuO2zoM_ZrrjTFFH4uuvChaXNwBCkzRpN0KtEQrrCXRleRk3K8vnUSOMncWMSKaOjw8fFhDRsuRMHUWA0ZwjYNgZ7DYYXj4sWsca3DroYE5s2Y_OczYWWbrsCEvnmqK_Lx0-zhj4zEf2HTfnnb7JsGACSHqQ_e2yQf02HHSEJuIaXY5KQ4q4Ell6Lt_wSVsDJOSl-yOGDsGOb7haJvzrYeUFyHi2JJmg8fGUILeoVEYLAXJ4N2HDx-flTqSQU7_vP88kh4hJaX8nEiL4ciQlUqsCVzr0RCIcYFgUK5d8xeLJSvAkHJt1Fo_5GOFbik76JWiLIeIxpD4n_VY3yZEMyFGpQZyZ4ujPkJc2hUyUaqxBydM46u3t3A95X7WI-ZrxEsB2snB0no-SgUrZ7949CzBcoSQnBTZ1PES_gng7y1rmVZd2_VxjREWgJt6oG3iuYqSeVw4czrwCOHm57hPGd_EVFAmf_2XMsQ8rR1ThV7gwFwbeMIQceJ0007KTRDW25VIJxrJQIb67oXxxnCIiG3iIZ8gYmsoos4iy2sSruRvOWDkE91pNpjIq6VQOoCUc31cwYo6G70-G7L2dmGI4GFtgqLu75OkVIcoEIVEQdhI5cVzcNLrd8QihZFAV6FfFKYwmEOSXNOh8rzoVRy2gdkENMa2BgcKlInDXdPW6sE0pVdgttQhriWWWT9jzgbDXd7T2HqKkYuWL_jf2JDOf_g-fc-_EMfa0lOw9bnM5jX8u-f_5b8dKdTdg5nZpdcqVBIr0FXwa802kNsolzKWSy_20DqAdMT2fjVYSS6TxzJMVynLssZwvwKNrIj1ZyufbU9Obhav1P0k_-BoRHXgPOKysnySmVOftEYp25enR1nCp0gZ5c1jOFcfVdKRnSu-lxWupBnHbY_3MjRJMpV9njZmJejuvGFWV3355iwqoZN5FMQdukFJII4ezn0mtv_2-2-7isc-gmy_qH58_ypW2XgYG-kTFOi_m0eMQg==&q=%s
# https://duckduckgo.com/?q=%s&kk=-1&kah=it-it&kl=wt-wt&ks=m&kaj=m&kam=osm&kp=-2&kn=-1&kd=1&kw=s&kak=-1&kax=-1&km=l

{ config, pkgs, ... }: let
  variables = import ./variables.nix;
  user = variables.user;
  dir = variables.dir;
  colors = variables.colors;
in {
  accounts.email = {
    accounts = {
      "polimi" = {
        address = "valeriy.litkovskyy@mail.polimi.it";
        aliases = [ "10622800@polimi.it" ];
        imap = {
          host = "outlook.office365.com";
          tls.enable = true;
        };
        mbsync = {
          enable = true;
          groups."polimi" = {
            channels = let makeChannel = master: slave: {
              extraConfig = {
                Create = "Slave";
                Sync = "All";
                Expunge = "Both";
                SyncState = "*";
              };
              masterPattern = master;
              slavePattern = slave;
            }; in {
              "inbox" = makeChannel "INBOX" "inbox";
              "archive" = makeChannel "Archive" "archive";
              "trash" = makeChannel "Deleted Items" "trash";
              "drafts" = makeChannel "Drafts" "drafts";
              "spam" = makeChannel "Junk Email" "spam";
              "sent" = makeChannel "Sent Items" "sent";
            };
          };
        };
        msmtp = {
          enable = true;
          extraConfig.logfile = "${dir.cache}/msmtp-polimi.log";
        };
        mu.enable = true;
        passwordCommand = "${pkgs.pass}/bin/pass show mail/polimi | ${pkgs.coreutils}/bin/head -n1";
        primary = true;
        realName = "Valeriy Litkovskyy";
        smtp = {
          host = "smtp.office365.com";
          tls = {
            enable = true;
            useStartTls = true;
          };
        };
        userName = "10622800@polimi.it";
      };
    };
    maildirBasePath = dir.mail;
  };

  fonts.fontconfig.enable = true;
  home = {
    # enableDebugInfo = true;     # gdb symbols
    extraOutputsToInstall = [ "man" "doc" "info" "devdoc" ];

    file = {
      ".abclrc".source = ./common-lisp.lisp;
      ".ccl-init.lisp".source = ./common-lisp.lisp;
      ".clisprc.lisp".source = ./common-lisp.lisp;
      ".eclrc".source = ./common-lisp.lisp;
      ".Xresources".onChange = ''
        ${pkgs.xorg.xrdb}/bin/xrdb -load ~/.Xresources || true
      '';
      ".profile".text = ''
        test -r "/home/${user}/.nix-profile/etc/profile.d/nix.sh" && . "/home/${user}/.nix-profile/etc/profile.d/nix.sh"
        test -r "/home/${user}/.nix-profile/etc/profile.d/hm-session-vars.sh" && . "/home/${user}/.nix-profile/etc/profile.d/hm-session-vars.sh"

        test -r "/home/${user}/.guix-profile/etc/profile" && . "/home/${user}/.guix-profile/etc/profile"
        test -r "${dir.config}/guix/current/etc/profile" && . "${dir.config}/guix/current/etc/profile"

        eval `${pkgs.openssh}/bin/ssh-agent`
      '';
      ".sbclrc".source = ./common-lisp.lisp;
      ".shinit".text = ''
        ${pkgs.coreutils}/bin/stty -ixon
        PS1='[$USER $?] $(test $UID -eq 0 && echo "#" || echo "$") '
      '';
      ".stalonetrayrc".text = pkgs.lib.generators.toKeyValue {
        mkKeyValue = pkgs.lib.generators.mkKeyValueDefault {} " ";
      } {
        background = "\"#000000\"";
        fuzzy_edges = "3";
        geometry = "1x1+10+742";
        grow_gravity = "SW";
        icon_gravity = "SW";
        icon_size = "16";
        skip_taskbar = true;
        sticky = true;
        transparent = true;
        window_layer = "bottom";
        window_strut = "bottom";
        window_type = "desktop";
      };
    };

    homeDirectory = "/home/${user}";

    keyboard = {
      layout = "dvorak,ru";
      options = [ "ctrl:swapcaps" "grp:shifts_toggle" ];
      variant = ",ruu";
    };

    language = {
      address = "en_US.UTF-8";
      base = "en_US.UTF-8";
      collate = "en_US.UTF-8";
      ctype = "en_US.UTF-8";
      measurement = "en_US.UTF-8";
      messages = "en_US.UTF-8";
      monetary = "en_US.UTF-8";
      name = "en_US.UTF-8";
      numeric = "en_US.UTF-8";
      paper = "en_US.UTF-8";
      telephone = "en_US.UTF-8";
      time = "en_US.UTF-8";
    };

    packages = with pkgs; [

      acpi alsaUtils ascii bind brightnessctl browser calibre cpulimit dmenu fd
      firefox ffmpeg file gimp hunspell hunspellDicts.en_US-large
      hunspellDicts.it_IT hunspellDicts.ru_RU imagemagick iw ledger leiningen
      libnotify libreoffice mediainfo mkpasswd mpc_cli myEmacs nload p7zip
      pass-otp pdftk perlPackages.JSONPP pinentry pueue pulsemixer pwgen
      qrencode rimer ripgrep rsync scripts scrot sdcv simplescreenrecorder
      sloccount speedtest-cli stalonetray stumpwm sxiv syncthing
      tor-browser-bundle-bin transmission ungoogled-chromium
      ungoogledChromiumIncognito unzip wget woof xclip xdg-user-dirs xterm xz
      youtube-dl ytdl zip zoom-us

    ];

    sessionPath = [ "${dir.config}/composer/vendor/bin" "${dir.data}/npm/bin" "/usr/local/bin" ];
    sessionVariables = {
      EDITOR = "emacs";
      VISUAL = "emacs";
      TERMINAL = "uxterm";
      LESSHISFILE = "/dev/null";
      MU_HOME = "${dir.cache}/mu";
      MAILDIR = "${dir.mail}";
      MPD_HOST = "localhost";
      MPD_PORT = "6600";
      SUDO_ASKPASS = "${pkgs.scripts}/bin/sudo_askpass";
      ENV = "/home/${user}/.shinit";
      "_JAVA_AWT_WM_NONREPARENTING" = "1";
      CUDA_CACHE_PATH = "${dir.cache}/nv";
      NPM_CONFIG_USERCONFIG = "${dir.config}/npm/npmrc";
      GEM_HOME = "${dir.cache}/gem";
      GEM_SPEC_CACHE = "${dir.cache}/gem";
      ANDROID_SDK_HOME = "${dir.cache}/android";
      ADB_VENDOR_KEY = "${dir.cache}/android";
      BOOT_HOME = "${dir.cache}/boot";
      YTDL_DIR="${dir.videos}/youtube";
      BROWSER = "browser";
      GTK2_RC_FILES = "${dir.cache}/gtk-2.0/gtkrc";
      GTK_IM_MODULE = "ibus";
      QT_IM_MODULE = "ibus";
      XMODIFIERS = "ibus";
      XAUTHORITY = "\${XDG_RUNTIME_DIR}/Xauthority";
      SSB_HOME = "${dir.cache}/zoom";
      LOCATE_PATH = "${dir.cache}/locatedb";
      RUSTUP_HOME = "${dir.cache}/rustup";
      CARGO_HOME = "${dir.cache}/cargo";
      QUICKLISP = "${dir.cache}/quicklisp";
      ELDEV_DIR = "${dir.cache}/eldev";
      INFOPATH = "$INFOPATH\${INFOPATH:+:}/usr/local/share/info";
    };

    stateVersion = "21.03";
    username = user;
  };

  programs = {
    bash = {
      enable = true;
      historyControl = [ "erasedups" "ignoredups" "ignorespace" ];
      historyIgnore = map (cmd: "${cmd}*") [
        "awk" "bash" "cat" "cd" "chmod" "chown" "command" "cp" "cut" "dash" "dd"
        "df" "dh" "du" "ebook-convert" "echo" "emacs" "env" "exit" "export" "fd"
        "feh" "file" "find" "gawk" "gparted" "grep" "gzip" "hash" "host" "htop"
        "id" "ln" "locate" "ls" "man" "mbsync" "millisleep" "mkdir" "mpv" "mv"
        "notify-send" "ping" "pkill" "printf" "pwd" "pwgen" "python" "quit"
        "read" "rg" "rimer" "rm" "rmdir" "rofi" "setsid" "sh" "sleep" "stow"
        "strings" "strip" "studies_" "sxiv" "tail" "time" "timer" "top" "touch"
        "tr" "uname" "uptime" "watch" "wc" "which" "woof" "xclip" "xz" "yay"
        "youtube-dl" "ytdl"
      ];
      initExtra = ''
        [ -n "$ENV" ] && . "$ENV"

        for f in ${dir.config}/guix/current/etc/bash_completion.d/* ; do
            test -r "$f" && . "$f"
        done
      '';
    };

    direnv = {
      config = {
        Whitelist = {
          prefix = [ "/home/${user}/Documents/projects/" ];
        };
      };
      enable = true;
      enableBashIntegration = true;
      enableNixDirenvIntegration = true;
    };

    feh.enable = true;

    git = {
      enable = true;
      extraConfig.credential.helper = "cache --timeout=86400";
      ignores = [ "*.elc" ".direnv" ".eldev" ];
      # signing = {
      #   key = "vlr.ltkvsk@protonmail.com";
      #   signByDefault = true;
      # };
      userEmail = "vlr.ltkvsk@protonmail.com";
      userName = "Valeriy Litkovskyy";
    };

    gpg = {
      enable = true;
      settings = {
        encrypt-to = "Litkovskyy Valeriy <vlr.ltkvsk@protonmail.com>";
      };
    };

    home-manager.enable = true;

    htop = {
      enable = true;
      enableMouse = false;
      hideThreads = true;
      hideUserlandThreads = true;
      highlightBaseName = true;
      meters.right = [ "Tasks" "LoadAverage" "Uptime" "Battery" ];
      showCpuUsage = true;
      showCpuFrequency = true;
      showThreadNames = true;
    };

    info.enable = true;

    jq.enable = true;

    man.generateCaches = true;

    mbsync.enable = true;

    mpv = {
      enable = true;
      config = {
        save-position-on-quit = true;
        watch-later-directory = "${dir.cache}/mpv/watch_later";
      };
    };

    msmtp.enable = true;
    mu.enable = true;

    readline = {
      enable = true;
      variables = {
        editing-mode = "emacs";
        blink-matching-paren = true;
      };
    };
  };

  services = {
    dunst = {
      enable = true;
      settings = {
        global = {
          geometry = "0x0-0+0";
          dmenu = "${pkgs.dmenu}/bin/dmenu";
          browser = "${pkgs.browser}/bin/browser";
          padding = 8;
          horizontal_padding = 8;
          frame_width = 3;
          frame_color = colors.base04;
          separator_color = "frame";
          font = "monospace 15";
          markup = "full";
          word_wrap = true;
        };
        urgency_low = {
          background = colors.base00;
          foreground = colors.base0D;
        };
        urgency_normal = {
          background = colors.base00;
          foreground = colors.base04;
        };
        urgency_critical = {
          background = colors.base00;
          foreground = colors.base08;
        };
      };
    };

    gammastep = {
      enable = true;
      latitude = "8.877";
      longitude = "47.339";
    };

    gpg-agent = {
      enable = true;
      defaultCacheTtl = 86400;
      maxCacheTtl = 86400;
      verbose = true;
    };

    # grobi.enable = true; # does not work on greypc. autorandr?

    mbsync = {
      enable = true;
      postExec = let mailSync = pkgs.writeShellScript "mailnotify" ''
        export PATH=${pkgs.dbus}/bin:$PATH
        ${pkgs.mu}/bin/mu index || ${pkgs.libnotify}/bin/notify-send "eMail" "There was a fetch of mail, but index is locked.\nPlease index manually."
        ${pkgs.coreutils}/bin/sleep 2
        count="$(${pkgs.mu}/bin/mu find flag:unread AND NOT flag:trashed | ${pkgs.coreutils}/bin/wc -l)"
        if test 0 -ne $count; then
            ${pkgs.libnotify}/bin/notify-send "eMail" "You have $count new emails." || ${pkgs.coreutils}/bin/true
        fi
      ''; in "${mailSync}";
      preExec = "${pkgs.coreutils}/bin/mkdir -p ${dir.mail}";
      verbose = true;
    };

    mpd = {
      enable = true;
      dataDir = "${dir.cache}/mpd";
      musicDirectory = dir.music;
      extraConfig = ''
        audio_output {
          type "pulse"
          name "My Pulse Output"
          mixer_type "software"
        }

        volume_normalization "yes"
        filesystem_charset   "UTF-8"
      '';
      network.startWhenNeeded = true;
    };

    random-background = {
      enable = true;
      imageDirectory = "${pkgs.wallpapers}";
      interval = "5min";
    };

    udiskie.enable = true;
    unclutter.enable = true;
  };

  systemd.user = {
    timers = {
      updatedb = {
        Unit = {
          Description = "Updabedb timer";
        };
        Timer = {
          Unit = "updatedb.service";
          OnCalendar = "13:00";
        };
        Install = {
          WantedBy = [ "timers.target" ];
        };
      };
    };

    services = {
      updatedb = {
        Unit = {
          Description = "Updatedb - filesystem database";
        };
        Service = {
          Environment = [ "PATH=${pkgs.gnused}/bin:${pkgs.coreutils}/bin" ];
          ExecStart = "${pkgs.findutils}/bin/updatedb --output=${dir.cache}/locatedb";
          IOSchedulingClass = "idle";
          Type = "oneshot";
        };
      };

      pueue = {
        Unit = {
          Description = "Pueue Daemon - CLI process scheduler and manager";
          After = [ "graphical-session-pre.target" ];
          PartOf = [ "graphical-session.target" ];
        };
        Service = {
          Restart = "no";
          ExecStart = "${pkgs.pueue}/bin/pueued";
          ExecReload = "${pkgs.pueue}/bin/pueued";
          Environment = "ASYNC_STD_THREAD_COUNT=4";
        };
        Install = {
          WantedBy = [ "graphical-session.target" ];
        };
      };

      rimer = {
        Unit = {
          Description = "Rimer Daemon - Concurrent timer";
          After = [ "graphical-session-pre.target" ];
          PartOf = [ "graphical-session.target" ];
        };
        Service = {
          Restart = "no";
          ExecStart = "${pkgs.rimer}/bin/rimer start ${pkgs.scripts}/bin/rimer_callback";
          ExecStop = "${pkgs.rimer}/bin/rimer quit";
        };
        Install = {
          WantedBy = [ "graphical-session.target" ];
        };
      };

      transmission = {
        Unit = {
          Description = "Transmission BitTorrent Daemon";
          After = [ "network.target" "graphical-session-pre.target" ];
          PartOf = [ "graphical-session.target" ];
        };
        Service = {
          Type = "notify";
          ExecStart = "${pkgs.transmission}/bin/transmission-daemon -f --log-error";
          ExecReload = "${pkgs.utillinux}/bin/kill -s HUP $MAINPID";
          NoNewPrivileges = true;
        };
        Install = {
          WantedBy = [ "graphical-session.target" ];
        };
      };

      xrdb = {
        Unit = {
          Description = "Load Xresources with xrdb";
          After = [ "graphical-session-pre.target" ];
          PartOf = [ "graphical-session.target" ];
        };
        Service = {
          ExecStart = "${pkgs.xorg.xrdb}/bin/xrdb -load %h/.Xresources";
          IOSchedulingClass = "idle";
          Type = "oneshot";
        };
        Install = {
          WantedBy = [ "graphical-session.target" ];
        };
      };
    };
  };

  xdg = {
    enable = true;

    cacheHome = dir.cache;

    configFile = {
      "emacs" = {
        source = ./emacs;
        recursive = true;
      };

      "fontconfig/fonts.conf".source = ./fonts.conf;

      "mpv/scripts/youtube-quality.lua".source = "${pkgs.mpvYoutubeQuality}/youtube-quality.lua";
      "mpv/script-opts/youtube-quality.conf".source = "${pkgs.mpvYoutubeQuality}/youtube-quality.conf";

      "npm/npmrc".text = pkgs.lib.generators.toKeyValue {} {
        prefix = "${dir.data}/npm";
        cache = "${dir.cache}/npm";
        init-module = "${dir.config}/npm/config/npm-init.js";
        tmp = "\${XDG_RUNTIME_DIR}/npm";
      };

      "stumpwm" = {
        source = ./stumpwm;
        recursive = true;
      };

      "youtube-dl/config".text = pkgs.lib.generators.toKeyValue {
        mkKeyValue = pkgs.lib.generators.mkKeyValueDefault {} " ";
      } {
        "--add-metadata" = "";
        "--ignore-errors" = "";
        "--continue" = "";
        "--no-playlist" = "";
        "--embed-subs" = "";
        "--output" = "'%(uploader)s/%(upload_date)s - %(title)s.%(ext)s'";
        "--format" = "'(bestvideo+bestaudio/best)[height<=?768][width<=?1366]'";
      };
    };

    configHome = dir.config;

    dataFile = {
      "applications/browser.desktop".text = pkgs.lib.generators.toINI {} {
        "Desktop Entry" = {
          Categories = "Network;WebBrowser;";
          Comment = "";
          Exec = "${pkgs.browser}/bin/browser %U";
          GenericName = "Web Browser";
          MimeType = "text/html;text/xml;application/xhtml+xml;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp";
          Name = "Browser";
          Terminal = false;
          Type = "Application";
        };
      };

      "stardict/dic".source = "${pkgs.stardictDictionaries}/share/stardict/dic";
    };

    dataHome = dir.data;

    mimeApps = {
      enable = true;
      associations = {
        added = {
          "application/pdf" = [ "emacs.desktop" ];
          "application/epub" = [ "emacs.desktop" ];
        };
        removed = {};
      };
      defaultApplications = {
        "application/pdf" = [ "emacs.desktop" ];
        "application/epub" = [ "emacs.desktop" ];
        "text/html" = [ "browser.desktop" ];
        "x-scheme-handler/https" = [ "browser.desktop" ];
        "x-scheme-handler/http" = [ "browser.desktop" ];
      };
    };

    userDirs = {
      enable = true;
      music = dir.music;
      videos = dir.videos;
    };
  };

  xresources.properties = import ./xresources.nix colors;

  xsession = {
    enable = true;
    initExtra = ''
      xset +fp ${pkgs.terminus_font}/share/fonts/terminus
    '';
    scriptPath = ".xinitrc";
    windowManager.command = "${pkgs.stumpwm}/bin/stumpwm";
  };
}
