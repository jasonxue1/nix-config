{
  pkgs,
  inputs,
  ...
}: {
  home = {
    packages = with pkgs; [
      nushell
    ];
    sessionVariables = {
      TOPIARY_CONFIG_FILE = "${inputs.topiary-nushell}/languages.ncl";
      TOPIARY_LANGUAGE_DIR = "${inputs.topiary-nushell}/languages";
    };
  };
}
