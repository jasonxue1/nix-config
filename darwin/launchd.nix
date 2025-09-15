{
  pkgs,
  lib,
  ...
}: let
  isDarwin = pkgs.stdenv.isDarwin;
  mkAgent = path: {
    enable = true;
    config = {
      ProgramArguments = [path];
      RunAtLoad = true;
      KeepAlive = false;
      LimitLoadToSessionType = "Aqua";
    };
  };
in {
  config = lib.mkIf isDarwin {
    launchd.agents = {
      karabiner-elements = mkAgent "/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_console_user_server";
      clash-verge = mkAgent "${pkgs.jason.clash-verge-rev}/Applications/Clash Verge.app/Contents/MacOS/clash-verge";
      bitwarden = mkAgent "/Applications/Bitwarden.app/Contents/MacOS/Bitwarden";
    };
  };
}
