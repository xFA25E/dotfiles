self: super: {
  myProfile = super.writeTextDir "etc/profile.d/my-profile.sh" ''
    export PATH=/nix/var/nix/profiles/default/bin:$PATH
    export MANPATH=/nix/var/nix/profiles/default/share/man::$MANPATH
    export INFOPATH=$HOME/.nix-profile/share/info:/nix/var/nix/profiles/default/share/info:/usr/share/info:$INFOPATH
  '';
}
