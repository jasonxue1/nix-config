{...}: {
  homebrew = {
    enable = true;
    onActivation.cleanup = "uninstall";

    casks = [
      "clash-verge-rev"
      "karabiner-elements"
    ];
  };
}
