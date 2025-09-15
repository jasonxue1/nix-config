{config, ...}: let
  keysSet = src: dest: let
    files = builtins.attrNames (builtins.readDir src);
    mkSecret = name: {
      sopsFile = "${src}/${name}";
      path = "${config.home.homeDirectory}/${dest}/${name}";
      format = "binary";
      mode = "0600";
    };
  in
    builtins.listToAttrs (
      map (n: {
        name = "keys-${n}";
        value = mkSecret n;
      })
      files
    );
in {
  sops = {
    age.keyFile = "${config.home.homeDirectory}/.age/key.txt";

    secrets =
      keysSet ./keys "keys"
      // keysSet ./env "env";
  };

  home = {
    sessionVariables = {
      SOPS_AGE_KEY_FILE = "${config.home.homeDirectory}/.age/key.txt";
    };
  };
}
