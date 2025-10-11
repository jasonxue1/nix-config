{pkgs, ...}: {
  xdg.configFile."git/config".onChange = ''
    rm -f ~/.gitconfig
  '';

  programs = {
    ssh = {
      enable = true;
      enableDefaultConfig = false;

      extraConfig = ''
        AddKeysToAgent no
        ServerAliveInterval 30
        ServerAliveCountMax 3
        HashKnownHosts yes
      '';

      matchBlocks = {
        "*" = {
          proxyCommand = "nc -v -x 127.0.0.1:7897 %h %p";
          extraOptions = {
            StrictHostKeyChecking = "accept-new";
            ControlMaster = "auto";
            ControlPersist = "10m";
            ControlPath = "/tmp/cm-%r@%h:%p";
          };
        };
        "github.com" = {
          hostname = "ssh.github.com";
          user = "git";
          port = 443;
          identitiesOnly = true;
          identityFile = "~/keys/jasonxue_ed25519_github";
        };
      };
    };

    gh = {
      enable = true;
      settings = {
        git_protocol = "ssh";
        prompt = "enabled";
      };
    };

    gpg = {
      enable = true;
      settings = {
        "pinentry-mode" = "loopback";
        "personal-digest-preferences" = "SHA512";
      };
    };

    git = {
      enable = true;
      lfs.enable = true;

      userName = "jasonxue";
      userEmail = "jason@xuechunxi.com";

      signing = {
        key = "E480A836F6DD2441";
        signByDefault = true;
      };

      extraConfig = {
        init.defaultBranch = "main";
        push.autoSetupRemote = true;
        pull.rebase = true;
        log.date = "iso";

        url = {
          "git@github.com:" = {
            insteadOf = [
              "https://github.com/"
              "http://github.com/"
            ];
          };
        };

        gpg.program = "${pkgs.gnupg}/bin/gpg";
        gpg.format = "openpgp";
        commit.gpgsign = true;
        tag.gpgsign = true;
        user.useConfigOnly = true;
      };

      delta = {
        enable = true;
        options = {
          diff-so-fancy = true;
          line-numbers = true;
          true-colors = "always";
        };
      };
    };

    lazygit = {
      enable = true;
      settings.git.overrideGpg = true;
    };
  };
}
