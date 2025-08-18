{config, ...}: {
  sops = {
    age.keyFile = "${config.home.homeDirectory}/.ssh/keys.txt";

    secrets."env" = {
      sopsFile = ./.env.sops;
      format = "binary";
      path = "${config.home.homeDirectory}/.env";
    };
  };
}
