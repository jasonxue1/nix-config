{config, ...}: {
  sops = {
    defaultSopsFile = ./.sops.yaml;
    age.keyFile = "${config.home.homeDirectory}/.age/key.txt";

    secrets.GH_TOKEN = {
      sopsFile = ./.env.json;
      format = "json";
      key = "GH_TOKEN";
    };
    secrets.GITHUB_TOKEN = {
      sopsFile = ./.env.json;
      format = "json";
      key = "GITHUB_TOKEN";
    };

    templates.".env.json" = {
      path = "${config.home.homeDirectory}/.env.json";
      content = ''
        {
          "GH_TOKEN": "${config.sops.placeholder."GH_TOKEN"}",
          "GITHUB_TOKEN": "${config.sops.placeholder."GITHUB_TOKEN"}"
        }
      '';
    };
  };

  home.sessionVariables = {
    SOPS_AGE_KEY_FILE = "${config.home.homeDirectory}/.age/key.txt";
  };
}
