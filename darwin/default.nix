{...}: {
  # Import unconditionally; submodules gate their config internally.
  imports = [
    ./key_mappings
    ./launchd.nix
  ];
}

