eval "$(jq -r 'to_entries|map("export \(.key)=\(.value|@sh)")|.[]' ~/.env.json)"
