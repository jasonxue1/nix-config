{config, ...}: {
  # sops-nix: decrypt env file to $HOME/.env using age key.
  sops = {
    defaultSopsFile = ./sops.yaml;
    age.keyFile = "${config.home.homeDirectory}/.ssh/keys.txt";
    secrets.env = {
      sopsFile = ./env.sops;
      format = "binary";
      path = "${config.home.homeDirectory}/.env";
    };
  };
}
