try {
  open $"($env.HOME)/.env"
  | lines
  | split column "=" key value
  | update value {|row| $row.value | str trim }
  | reduce -f {} {|row acc| $acc | upsert $row.key $row.value }
  | load-env
}
