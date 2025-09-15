{...}: {
  homebrew = {
    enable = true;
    onActivation.cleanup = "uninstall";

    casks = [
      "karabiner-elements"
    ];
  };
}
