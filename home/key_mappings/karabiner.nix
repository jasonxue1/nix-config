{...}: {
  launchd.agents.karabiner-elements = {
    enable = true;
    config = {
      ProgramArguments = [
        "/Applications/Karabiner-Elements.app/Contents/MacOS/Karabiner-Elements"
      ];
      RunAtLoad = true;
      KeepAlive = false;
      LimitLoadToSessionType = "Aqua";
    };
  };
  xdg.configFile."karabiner".source = ./karabiner;
}
