{pkgs, ...}: let
  names = [
    "auto_sleep"
    "focus_app"
    "nix_docker_build"
  ];
  mk = name:
    pkgs.writeShellApplication {
      inherit name;
      text = builtins.readFile ./${name}.sh;
    };
in {
  home.packages = map mk names;
}
