{ pkgs, ... }:
let
  names = [
    "auto_sleep"
    "focus_app"
  ];
  mk =
    name:
    pkgs.writeShellApplication {
      inherit name;
      text = builtins.readFile ./${name}.sh;
    };
in
{
  home.packages = map mk names;
}
