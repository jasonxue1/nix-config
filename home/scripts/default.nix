{pkgs, ...}: {
  home.packages = [
    (pkgs.writeShellApplication {
      name = "auto_sleep";
      text = builtins.readFile ./auto_sleep.sh;
    })
  ];
}
