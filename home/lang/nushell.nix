{
  pkgs,
  topiary-nushell,
  ...
}: {
  home = {
    packages = with pkgs; [
      nushell
    ];
    sessionVariables = {
      TOPIARY_CONFIG_FILE = "${topiary-nushell}/languages.ncl";
      TOPIARY_LANGUAGE_DIR = "${topiary-nushell}/languages";
    };
  };
}
