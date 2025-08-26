{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.nushell = {
    shellAliases = {
      ls = lib.mkForce "ls";
      test = "ecal test";
    };
    enable = true;
    extraEnv =
      ''
        let to_add_path = [ ${builtins.concatStringsSep " " (map (p: "\"${p}\"") config.home.sessionPath)} ]
        $env.PATH = ($to_add_path | append $env.PATH | uniq)

        let to_add_vars = ${builtins.toJSON config.home.sessionVariables}
        load-env $to_add_vars
      ''
      + builtins.readFile ./env.nu;
    settings = {
      edit_mode = "vi";
      completions = {
        algorithm = "fuzzy";
      };
    };
    plugins = with pkgs.nushellPlugins; [
      highlight
      skim
      gstat
    ];
  };
}
