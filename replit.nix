{ pkgs }: {
  deps = [
    pkgs.ed
    pkgs.vim
    pkgs.q-text-as-data
    pkgs.bashInteractive
    pkgs.nodePackages.bash-language-server
    pkgs.man
  ];
}