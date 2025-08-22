{
  config,
  lib,
  ...
}: let
  shell_aliases_default = import ../shell_aliases.nix;
  shell_aliases_remove = ["ls"];
  shell_aliases_extra = {
    test = "echo test";
  };
  shellAliases = (lib.removeAttrs shell_aliases_default shell_aliases_remove) // shell_aliases_extra;
in {
  programs.nushell = {
    enable = true;
    inherit shellAliases;
    extraEnv = ''
      let to_add = [ ${builtins.concatStringsSep " " (map (p: "\"${p}\"") config.home.sessionPath)} ]
      $env.PATH = ($to_add | append $env.PATH | uniq)
    '';
  };
}
