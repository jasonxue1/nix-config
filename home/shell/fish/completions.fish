set -l p /etc/profiles/per-user/jason/share/fish/completions
if not contains -- $p $fish_complete_path
    set -g fish_complete_path $p $fish_complete_path
end
