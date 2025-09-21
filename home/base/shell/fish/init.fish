set -gx fish_user_paths /run/wrappers/bin $fish_user_paths
if test -f $HOME/.env.json
    for key in (jq -r 'keys[]' $HOME/.env.json)
        # @fish-lsp-disable-next-line 3003
        set -gx $key (jq -r --arg k "$key" '.[$k]' $HOME/.env.json)
    end
end
