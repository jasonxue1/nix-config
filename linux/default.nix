{ pkgs, ... }: {
  # Linux-specific Home Manager settings
  imports = [];

  # Placeholder package: ensure Linux adds htop
  home.packages = [ pkgs.htop ];
}

