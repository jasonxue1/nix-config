{
  pkgs,
  topiary_nushell,
  ...
}: {
  home = {
    packages = with pkgs; [
      nushell
    ];
    sessionVariables = {
      TOPIARY_CONFIG_FILE = "${topiary_nushell}/languages.ncl";
      TOPIARY_LANGUAGE_DIR = "${topiary_nushell}/languages";
    };
  };
}
