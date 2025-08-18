# Repository Guidelines

## Project Structure & Module Organization
- Root: `flake.nix` (entrypoint), `flake.lock`, `.sops.yaml`, `.gitignore`.
- Home Manager: `home/` contains user modules (e.g., `home.nix`, `zsh.nix`, `neovim.nix`, `tmux.nix`, `firefox.nix`) and supporting assets like `nvim/` and `.p10k.zsh`.
- Secrets: encrypted files live in `home/.env.sops` managed by `sops-nix`.

## Build, Test, and Development Commands
- Build system config: `darwin-rebuild build --flake .#jason-MacBook-Pro` (no changes applied).
- Apply system config: `darwin-rebuild switch --flake .#jason-MacBook-Pro`.
- Flake checks: `nix flake check` to validate evaluation and formatting.
- Format Nix code: `alejandra .`.
- Format Lua code: `nix run nixpkgs#stylua -- home/nvim` (respects `home/nvim/.stylua.toml`).

### One-off formatter invocations (no dev shell)
- `alejandra .` to format all Nix files.
- `nix run nixpkgs#stylua -- home/nvim` to format Lua files.

## Coding Style & Naming Conventions
- Indentation: 2 spaces; keep lines focused and expressions minimal.
- Formatting: always run `alejandra .` and `stylua` before committing.
- Modules: one concern per `*.nix` file; import via `home/home.nix`.
- Filenames: lowercase with hyphens if needed (e.g., `kitty.nix`, `lang.nix`).
- Attribute naming: prefer lowerCamelCase following Nixpkgs patterns (e.g., `home.stateVersion`, `environment.systemPackages`).

## Testing Guidelines
- Evaluate without applying: `darwin-rebuild build --flake .#jason-MacBook-Pro`.
- Run flake checks: `nix flake check` before PRs.
- For Home Manager changes, rely on the integrated module; a full `switch` validates activation order and options.

## Commit & Pull Request Guidelines
- Commits: imperative mood, short scope prefix when helpful (`home: add ripgrep`, `nix: tweak substituters`).
- Include context: what changed, why, and any user-visible effects.
- PRs: provide a concise description, example commands used (e.g., the exact `darwin-rebuild` invocation), and reference related issues.

## Security & Configuration Tips
- Secrets via `sops-nix`: edit with `sops home/.env.sops`; never commit decrypted secrets.
- Environment proxies are set in `home/home.nix`; avoid hardcoding credentials elsewhere.
