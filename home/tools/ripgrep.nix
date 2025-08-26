{...}: {
  programs.ripgrep = {
    enable = true;
    arguments = [
      "-i"
    ];
  };
}
