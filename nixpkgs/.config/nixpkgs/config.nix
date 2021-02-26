{
  packageOverrides = pkgs: with pkgs; rec {
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
        mkdir -p "$out/bin"
        install -m555 "$src" "$out/bin/eldev"
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

    stalonetray = symlinkJoin {
      name = "stalonetray";
      paths = [ pkgs.stalonetray ];
      buildInputs = [ makeWrapper ];
      postBuild = ''
        wrapProgram "$out/bin/stalonetray" --add-flags "--config \"\''${XDG_CONFIG_HOME:-\''${HOME}/.config}/stalonetray/stalonetrayrc\""
      '';
    };

    sbcl = symlinkJoin {
      name = "sbcl";
      paths = [ pkgs.sbcl ];
      postBuild = ''
        mv "$out/bin/sbcl" "$out/bin/.sbcl-wrapped"

        echo '#!${stdenv.shell}' >> "$out/bin/sbcl"
        echo 'ARGS="$*"' >> "$out/bin/sbcl"
        echo 'USERINIT="''${XDG_CONFIG_HOME:-''${HOME}/.config}/sbcl/init.lisp"' >> "$out/bin/sbcl"
        echo 'if test "''${ARGS#*$--userinit}" != "$ARGS" || ! test -r "$USERINIT"; then' >> "$out/bin/sbcl"
        echo '    exec -a "$0" "'"$out/bin/.sbcl-wrapped"'" "$@"' >> "$out/bin/sbcl"
        echo 'else' >> "$out/bin/sbcl"
        echo '    exec -a "$0" "'"$out/bin/.sbcl-wrapped"'" --userinit "$USERINIT" "$@"' >> "$out/bin/sbcl"
        echo 'fi' >> "$out/bin/sbcl"

        chmod 555 "$out/bin/sbcl"
      '';
    };

    ungoogled-chromium = symlinkJoin {
      name = "ungoogled-chromium";
      paths = [ pkgs.ungoogled-chromium ];
      buildInputs = [ makeWrapper ];
      postBuild = ''
        makeWrapper "$out/bin/chromium" "$out/bin/chromium-incognito" --add-flags "-incognito"
      '';
    };

    emacs = symlinkJoin {
      name = "emacs";
      paths = [ pkgs.emacs ];
      buildInputs = [ makeWrapper ];
      postBuild = ''
        makeWrapper "$out/bin/emacsclient" "$out/bin/emacseditor" --add-flags "--create-frame --alternate-editor=\"$out/bin/emacs\""
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

    youtube-dl = let
      dir = "\\\${YTDL_DIR:-\\\${XDG_VIDEOS_DIR:-\\\${HOME}/Videos}}";
      title = "%(title)s.%(ext)s";
      vid = "%(upload_date)s - ${title}";
      playlist = "%(playlist_uploader)s/%(playlist)s/%(playlist_index)s";
      p = "${playlist}${vid}";
      pa = "${playlist} - ${title}";
      y = "${dir}/%(uploader)s/${vid}";
    in symlinkJoin {
      name = "youtube-dl";
      paths = [ pkgs.youtube-dl];
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

    myScripts = stdenv.mkDerivation {
      name = "my-scripts";
      src = fetchFromGitHub {
        owner = "xFA25E";
        repo = "dotfiles";
        rev = "40c7a2b72af7a28dae7e68e732d259d987ae5a98";
        sha256 = "1l0jmv1jxgrq9dvk8f9yihhas9aym7imp8vi9x5h26chrkddi1bs";
      };
      installPhase = ''
        install -D -v -t "$out/bin" "$src/bin/.local/bin/"*
      '';
    };

    myPackages = pkgs.buildEnv {
      name = "my-packages";
      paths = [
        (let my-profile = writeText "my-profile" ''
          export PATH=$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/sbin:/bin:/usr/sbin:/usr/bin:$PATH
          export MANPATH=$HOME/.nix-profile/share/man:/nix/var/nix/profiles/default/share/man:/usr/share/man:$MANPATH
          export INFOPATH=$HOME/.nix-profile/share/info:/nix/var/nix/profiles/default/share/info:/usr/share/info:$INFOPATH
        ''; in runCommand "profile" {} ''
          mkdir -p $out/etc/profile.d
          cp ${my-profile} $out/etc/profile.d/my-profile.sh
        '')
        checkbashisms dejavu_fonts dmenu eldev emacs fd feh file firefox git
        gnupg hack-font htop iosevka jq ledger leiningen libreoffice-fresh man
        mkpasswd mpc_cli mpd mpop mpv msmtp mtpfs mu p7zip pass-otp pinentry
        pueue pulsemixer pwgen qrencode qtox # qutebrowser
        rimer ripgrep rsync
        rustup sctd sbcl sdcv shellcheck simplescreenrecorder sloccount
        speedtest-cli stalonetray stow sxiv syncthing tdesktop transmission
        ungoogled-chromium woof xclip xz youtube-dl zip

      ];
      # pathsToLink = [ "/share/man" "/share/doc" "/share/info" "/bin" "/etc" ];
      extraOutputsToInstall = [ "man" "doc" "info" ];
      postBuild = ''
        if [ -x $out/bin/install-info -a -w $out/share/info ]; then
          shopt -s nullglob
          for i in $out/share/info/*.info $out/share/info/*.info.gz; do
              $out/bin/install-info $i $out/share/info/dir
          done
        fi
      '';
    };
  };
}