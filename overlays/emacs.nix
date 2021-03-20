self: super: let
  emacs-overlay = import (builtins.fetchTarball {
    url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
  }) self super;

  overrides = eself: esuper: {
    # my
    cyrillic-dvorak-im = esuper.trivialBuild {
      pname = "cyrillic-dvorak-im";
      ename = "cyrillic-dvorak-im";
      version = "20191017.2111";
      src = super.fetchFromGitHub {
        owner = "xFA25E";
        repo = "cyrillic-dvorak-im";
        rev = "09edcbc420ebae3ec069df95a768f79e6edcc76f";
        sha256 = "1h3y8xj3zcnhxim7g78snsx01a2p0mq0lhg954ly6snna8m3dzvf";
      };
      packageRequires = [ eself.emacs ];
      meta = {
        homepage = "https://github.com/xFA25E/cyrillic-dvorak-im";
        license = super.lib.licenses.free;
      };
    };
    shell-pwd = esuper.trivialBuild {
      pname = "shell-pwd";
      ename = "shell-pwd";
      version = "20210306.1333";
      src = super.fetchFromGitHub {
        owner = "xFA25E";
        repo = "shell-pwd";
        rev = "dbb3a1a35fbd8fbfe9592e1529b649a99d015cd2";
        sha256 = "0zq1pn5lk57c7sdrqk1ccy05dm1h9vqbp77h74gpp73xmwj3avbh";
      };
      packageRequires = [
        eself.emacs
        # (require 'tramp)
        # (require 'files)
      ];
      meta = {
        homepage = "https://github.com/xFA25E/shell-pwd";
        license = super.lib.licenses.free;
      };
    };
    skempo = esuper.trivialBuild {
      pname = "skempo";
      ename = "skempo";
      version = "0.1.0";
      src = super.fetchFromGitHub {
        owner = "xFA25E";
        repo = "skempo";
        rev = "ff11999e1a4cc034b399a5fa685da1f76f93d5b2";
        sha256 = "0qm3zsz5kivvxrrn26f6a5nsvmany9629jd3dz2k7ahz02mky6rr";
      };
      packageRequires = [ eself.emacs eself.parent-mode ];
      meta = {
        homepage = "https://github.com/xFA25E/skempo";
        license = super.lib.licenses.free;
      };
    };
    readelf-mode = esuper.trivialBuild {
      pname = "readelf-mode";
      ename = "readelf-mode";
      version = "1.0.0";
      src = super.fetchFromGitHub {
        owner = "sirikid";
        repo = "readelf-mode";
        rev = "1.0.0";
        sha256 = "05rsky6wvgpaidky2cs4xw0ma0j3z6zqdl3djnkp795rr1a9gi0n";
      };
      packageRequires = [ eself.emacs ];
      meta = {
        homepage = "https://github.com/sirikid/readelf-mode";
        license = super.lib.licenses.free;
      };
    };
    mediainfo-mode = esuper.trivialBuild {
      pname = "mediainfo-mode";
      ename = "mediainfo-mode";
      version = "0.2.0";
      src = super.fetchFromGitHub {
        owner = "xFA25E";
        repo = "mediainfo-mode";
        rev = "96aed2e3f0f5bd8959a71f983f5f87b12ec9057c";
        sha256 = "1gmmlvrlpwpsdn764l0lwhabhc6ilmiq264ln0x9w3vvrfxy1mvl";
      };
      packageRequires = [ eself.emacs ];
      meta = {
        homepage = "https://github.com/xFA25E/mediainfo-mode";
        license = super.lib.licenses.free;
      };
    };
    youtube-comments = esuper.trivialBuild {
      pname = "youtube-comments";
      ename = "youtube-comments";
      version = "20210222.2247";
      src = super.fetchFromGitHub {
        owner = "xFA25E";
        repo = "youtube-comments";
        rev = "621f9e9677241c06bb02a1b7eee46541b2d9c2c2";
        sha256 = "1h4rn7mpj9y22dq8a13rxzm3bbgh4qap4pwvc9mnr7bl6adc94pi";
      };
      packageRequires = [ eself.emacs ];
      meta = {
        homepage = "https://github.com/xFA25E/youtube-comments";
        license = super.lib.licenses.free;
      };
    };
    pueue = esuper.trivialBuild {
      pname = "pueue";
      ename = "pueue";
      version = "0.1.0";
      src = super.fetchFromGitHub {
        owner = "xFA25E";
        repo = "pueue";
        rev = "a4467da565833e83c650740719d1c51fba6658eb";
        sha256 = "1k68mnxbsc8k450y0yfnan2vqa86lrb176mxv4pvqfkz4icpxyqf";
      };
      packageRequires = [ eself.emacs eself.bui ];
      meta = {
        homepage = "https://github.com/xFA25E/pueue";
        license = super.lib.licenses.free;
      };
    };
    torrent-mode = esuper.trivialBuild {
      pname = "torrent-mode";
      ename = "torrent-mode";
      version = "20201109.910";
      src = super.fetchFromGitHub {
        owner = "xFA25E";
        repo = "torrent-mode";
        rev = "211f4f6ed8759e3817c636a39b1b26e40375aad9";
        sha256 = "1m5q9zdcgx7kvaybm6jgn0p5sqkjdrbrqqfhcnywfirh146xi2hx";
      };
      packageRequires = [ eself.emacs ];
      meta = {
        homepage = "https://github.com/xFA25E/torrent-mode";
        license = super.lib.licenses.free;
      };
    };
    fb2-mode = esuper.trivialBuild {
      pname = "fb2-mode";
      ename = "fb2-mode";
      version = "20201109.910";
      src = super.fetchFromGitHub {
        owner = "spline1986";
        repo = "fb2-mode";
        rev = "edd56bfa3966eb6f7a9a9ed513c6463907122b3d";
        sha256 = "0c8vrljm566pks14bi4zaw3qpwpl27052gq1rm1zwk4qa23cb2mp";
      };
      packageRequires = [ eself.emacs ];
      meta = {
        homepage = "https://github.com/spline1986/fb2-mode";
        license = super.lib.licenses.free;
      };
    };
  };
  emacsWithPackages = ((emacs-overlay.emacsPackagesFor super.emacs).overrideScope' overrides).emacsWithPackages;
in {
  myEmacs = emacsWithPackages (epkgs: with epkgs; [
    # my
    cyrillic-dvorak-im fb2-mode mediainfo-mode pueue readelf-mode shell-pwd
    skempo torrent-mode youtube-comments

    # melpa
    ace-link acme-theme apache-mode async avy bash-completion bicycle cargo
    cider clipmon clojure-mode consult diff-hl diminish dired-rsync dumb-jump
    edit-indirect eglot emmet-mode fd-dired flycheck flycheck-checkbashisms
    form-feed format-all free-keys gcmh geiser gitconfig-mode gitignore-mode
    htmlize insert-char-preview ipretty json-mode leaf ledger-mode magit
    marginalia mingus neato-graph-bar nix-mode nov orderless org-mime
    outline-minor-faces pdf-tools php-mode quelpa restclient reverse-im rg
    robots-txt-mode rust-mode sdcv shr-tag-pre-highlight sly sly-asdf
    sly-quicklisp smartparens sqlup-mode sudo-edit transmission vlf web-mode
    wgrep which-key


    # elpa
    csv-mode dired-git-info modus-operandi-theme rainbow-mode sql-indent

    # org
    org-plus-contrib
  ]);

  emacsEditor = super.writeShellScriptBin "emacseditor" ''
    "${self.myEmacs}/bin/emacsclient" --create-frame --alternate-editor=${self.myEmacs}/bin/emacs "$@"
  '';
}
