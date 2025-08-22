{
  config,
  lib,
  ...
}: {
  programs.nushell = {
    shellAliases = {
      ls = lib.mkForce "ls";
      test = "ecal test";
    };
    enable = true;
    extraEnv = ''
      let to_add = [ ${builtins.concatStringsSep " " (map (p: "\"${p}\"") config.home.sessionPath)} ]
      $env.PATH = ($to_add | append $env.PATH | uniq)
    '';
  };
}
