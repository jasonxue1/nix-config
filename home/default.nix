{...}: {
  # Aggregate common HM modules for both macOS and Linux
  home.stateVersion = "25.05";
  imports = [
    ./base
    ./dev
    ./apps
    ./secrets
  ];
}
