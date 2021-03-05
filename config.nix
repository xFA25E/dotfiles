{
  packageOverrides = pkgs: with pkgs; rec {

    stardictDicts = runCommand "stardict-dicts" {
      srcs = let
        getName = dic: lib.strings.removeSuffix ".tar.bz2" (baseNameOf dic.url);
        makeAttrs = dic: dic // { name = getName dic; };
        fetch = dic: fetchzip (makeAttrs dic);
        in map fetch (import ./stardict-dicts.nix);
    } ''
      mkdir -p "$out/share/stardict/dic"
      for src in $srcs; do
          ln -s "$src" "$out/share/stardict/dic/$(stripHash $src)"
      done
    '';

    mpvYoutubeQuality = fetchFromGitHub {
      owner = "jgreco";
      repo = "mpv-youtube-quality";
      rev = "1f8c31457459ffc28cd1c3f3c2235a53efad7148";
      sha256 = "09z6dkypg0ajvlx02270p3zmax58c0pkqkh6kh8gy2mhs3r4z0xy";
    };

    myScripts = stdenv.mkDerivation {
      name = "my-scripts";
      src = ./bin;
      nativeBuildInputs = [ makeWrapper ];
      installPhase = ''
        install -D -t "$out/bin" "$src/"*
      '';
      postFixup = let
        join = lib.strings.concatStringsSep "\n";
        makeBins = lib.strings.makeBinPath;
        makeLine = (s: d: "wrapProgram \"$out/bin/${s}\" --set PATH \"${makeBins d}\"");
        mapLines = lib.attrsets.mapAttrsToList makeLine;
        scripts = {
          "compress_video" = [ ffmpeg ];
          "extract_eml" = [ mu coreutils ];
          "format_duration" = [ gawk ];
          "image_clipboard" = [ xclip file ];
          "make_backup" = [ util-linux gawk dmenu coreutils findutils ];
          "make_video_queue" = [ findutils coreutils gawk "$out" ];
          "mpvi" = [ libnotify mpv dmenu myYoutubeDl jq coreutils gawk gnused ];
          "notify_sound" = [ mpv ];
          "qrshow" = [ libnotify coreutils qrencode sxiv ];
          "random_wallpaper" = [ feh findutils coreutils ];
          "rimer_callback" = [ coreutils libnotify dmenu gawk "$out"];
          "rmount" = [ coreutils util-linux gawk findutils dmenu sudo libnotify mtpfs ];
          "rumount" = [ dmenu gawk util-linux libnotify gnugrep coreutils ];
          "search_ebook" = [ coreutils findutils ];
          "ssh-askpass" = [ findutils gnused dmenu coreutils pass-otp ];
          "strip_video" = [ ffmpeg ];
          "studies_plot" = [ gnuplot ];
          "sudo_askpass" = [ pass-otp ];
          "video_duration" = [ ffmpeg jq ];
          "ytdlam" = [ myYoutubeDl findutils coreutils dmenu ];
          "ytdli" = [ bash dmenu libnotify myYoutubeDl jq coreutils pueue gawk gnused util-linux "$out" ];
        }; in join (mapLines scripts);
    };

    eldev = stdenv.mkDerivation rec {
      pname = "eldev";
      version = "0.8.1";
      src = fetchurl {
        url = "https://raw.githubusercontent.com/doublep/eldev/${version}/bin/eldev";
        sha256 = "0csn6c4w95iswqdlj5akzspcm5ar7imngqcdch87ac21wz8xigln";
      };
      buildInputs = [ makeWrapper emacs ];
      unpackPhase = "true";
      installPhase = ''
        install -D -v -m555 "$src" "$out/bin/eldev"
        wrapProgram "$out/bin/eldev" --set ELDEV_EMACS "${emacs}/bin/emacs"
      '';
    };

    rimer = rustPlatform.buildRustPackage rec {
      pname = "rimer";
      version = "";
      src = fetchFromGitHub {
        owner = "xFA25E";
        repo = pname;
        rev = "ad1dbbef0a116cc115997d54041bec13f69fe43c";
        sha256 = "061nfws326h4dml7rlr2i1qc9a5xmf8lpkbl81z42v5abzc6f05x";
      };
      doCheck = false;
      cargoSha256 = "1r03334c8y5kj102cz2f9x57h1v3z3dw7nxhjm7gpin16lwvd5ca";
      meta = with lib; {
        description = "Simple timer that executes commands on update";
        homepage = "https://github.com/xFA25E/rimer";
        license = licenses.unlicense;
        maintainers = [ "Valeriy Litkovskyy" ];
      };
    };

    sctd = rustPlatform.buildRustPackage rec {
      pname = "sctd";
      version = "0.2.0";
      src = fetchFromGitHub {
        owner = "amir";
        repo = pname;
        rev = version;
        sha256 = "17qzi7i12yxb7cxwgax6d93mg4lvzmm4v3b3yra63w7287gn5xjh";
      };
      nativeBuildInputs = [ pkgconfig ];
      buildInputs = [ xorg.libX11 xorg.libXrandr ];
      cargoSha256 = "0wchlkf43w8rig4z31z09vk7f4fimia6a1aajxmf2csz0g2c6hi1";
      meta = with lib; {
        description = "set color temperature daemon";
        homepage = "https://github.com/amir/sctd";
        license = licenses.cc0;
        maintainers = [ "Amir Saeid <amir@glgdgt.com>" ];
      };
    };

    ungoogledChromiumIncognito = writeShellScriptBin "chromium-incognito" ''
      exec "${ungoogled-chromium}/bin/chromium" -incognito "$@"
    '';

    mssl = openssl.overrideAttrs (oldAttrs: {
      meta = oldAttrs.meta // { outputsToInstall = [ "out" ]; };
    });

    myYoutubeDl = let
      dir = "\\\${YTDL_DIR:-\\\${XDG_VIDEOS_DIR:-\\\${HOME}/Videos}}";
      title = "%(title)s.%(ext)s";
      vid = "%(upload_date)s - ${title}";
      playlist = "%(playlist_uploader)s/%(playlist)s/%(playlist_index)s";
      p = "${playlist}${vid}";
      pa = "${playlist} - ${title}";
      y = "${dir}/%(uploader)s/${vid}";
    in symlinkJoin {
      name = "youtube-dl";
      paths = [ pkgs.youtube-dl ];
      buildInputs = [ makeWrapper ];
      postBuild = ''
        makeWrapper "$out/bin/youtube-dl" "$out/bin/ytdl"
        makeWrapper "$out/bin/ytdl" "$out/bin/ytdla" --add-flags "--format \"bestaudio/best\" --extract-audio"
        makeWrapper "$out/bin/ytdl" "$out/bin/ytdlp" --add-flags "--output \"${p}\" --yes-playlist"
        makeWrapper "$out/bin/ytdla" "$out/bin/ytdlpa" --add-flags "--output \"${pa}\" --yes-playlist"
        makeWrapper "$out/bin/ytdl" "$out/bin/ytdly" --add-flags "--output \"${y}\""
        makeWrapper "$out/bin/ytdla" "$out/bin/ytdlay" --add-flags "--output \"${y}\""
        makeWrapper "$out/bin/ytdl" "$out/bin/ytdlpy" --add-flags "--output \"${dir}/${p}\" --yes-playlist"
        makeWrapper "$out/bin/ytdla" "$out/bin/ytdlpay" --add-flags "--output \"${dir}/${pa}\" --yes-playlist"
      '';
    };

    dmenu = symlinkJoin {
      name = "dmenu";
      paths = [ pkgs.dmenu ];
      buildInputs = [ makeWrapper ];
      postBuild = ''
        wrapProgram "$out/bin/dmenu" --add-flags "-fn 'Iosevka-20' -i -nb white -nf black -sb black -sf white"
      '';
    };

    myProfile = writeTextDir "etc/profile.d/my-profile.sh" ''
      export PATH=/nix/var/nix/profiles/default/bin:$PATH
      export MANPATH=/nix/var/nix/profiles/default/share/man::$MANPATH
      export INFOPATH=$HOME/.nix-profile/share/info:/nix/var/nix/profiles/default/share/info:/usr/share/info:$INFOPATH
    '';
  };
}
