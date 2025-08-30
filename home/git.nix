{...}: {
  # Git, SSH, and GitHub CLI configuration.
  xdg.configFile."git/config".onChange = ''
    rm -f ~/.gitconfig
  '';

  programs = {
    ssh = {
      enable = true;
      enableDefaultConfig = false;

      extraConfig = ''
        AddKeysToAgent no
        UseKeychain yes
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
          identityFile = "~/.ssh/jasonxue_ed25519_github";
        };
      };
    };

    gh = {
      enable = true;
      settings = {
        git_protocol = "ssh";
        prompt = "enabled";
      };
      hosts = {
        "github.com" = {
          users = {
            "jasonxue1" = null;
          };
          user = "jasonxue1";
        };
      };
    };

    git = {
      enable = true;
      lfs.enable = true;

      userName = "jasonxue";
      userEmail = "jason@xuechunxi.com";

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

        gpg.format = "ssh";
        user.signingkey = "~/.ssh/jasonxue_ed25519_signing";
        commit.gpgsign = true;
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
