set -gx fish_user_paths /run/wrappers/bin $fish_user_paths
if test -f $HOME/env/fish_env
    source $HOME/env/fish_env
end
