{pkgs, ...}: let
  tideScript = builtins.readFile ./tide.fish;
in {
  programs.fish = {
    enable = true;
    plugins = [
      {
        name = "tide";
        inherit (pkgs.fishPlugins.tide) src;
      }
      {
        name = "autopair";
        inherit (pkgs.fishPlugins.autopair) src;
      }
      {
        name = "fzf-fish";
        inherit (pkgs.fishPlugins.fzf-fish) src;
      }
      {
        name = "fifc";
        inherit (pkgs.fishPlugins.fifc) src;
      }
      {
        name = "colored-man-pages";
        inherit (pkgs.fishPlugins.colored-man-pages) src;
      }
    ];
    shellInit = builtins.readFile ./init.fish;
  };

  home.packages = [
    (
      pkgs.writeScriptBin "tide-setup" ''
        #!${pkgs.fish}/bin/fish
        ${tideScript}
      ''
    )
  ];
}
