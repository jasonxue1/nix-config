# Repository Guidelines

## Project Structure & Module Organization

- Root: `flake.nix` (entrypoint), `flake.lock`, `.sops.yaml`, `.gitignore`.
- Home Manager: `home/` contains user modules
  (e.g., `home.nix`, `zsh.nix`, `neovim.nix`, `tmux.nix`, `firefox.nix`)
  plus assets like `home/nvim/` and `home/.p10k.zsh`.
- Secrets: encrypted in `home/.env.sops` via `sops-nix` (never commit decrypted data).

## Build, Test, and Development Commands

- Build config (no apply): `darwin-rebuild build --flake .#jason-MacBook-Pro`.
- Apply config: `darwin-rebuild switch --flake .#jason-MacBook-Pro`.
- Flake checks: `nix flake check` (evaluates modules and formatting checks).
- Format Nix: `alejandra .`.
- Format Lua: `nix run nixpkgs#stylua -- home/nvim` (uses `home/nvim/.stylua.toml`).

## Coding Style & Naming Conventions

- Indentation: 2 spaces; keep expressions minimal and readable.
- Modules: one concern per `*.nix`; import via `home/home.nix`.
- Filenames: lowercase with hyphens (e.g., `kitty.nix`, `lang.nix`).
- Attribute names: lowerCamelCase (e.g., `home.stateVersion`, `environment.systemPackages`).
- Always run `alejandra .` and `stylua` before committing.

## Testing Guidelines

- Evaluate without applying: `darwin-rebuild build --flake .#jason-MacBook-Pro`.
- Run `nix flake check` before PRs to validate evaluation and style.
- Home Manager changes are exercised by `switch`;
  rely on activation to surface ordering/options issues.

## Commit & Pull Request Guidelines

- Commits: imperative mood with optional scope
  (e.g., `home: add ripgrep`, `nix: tweak substituters`).
- Include what changed, why, and user-visible effects.
- PRs: concise description, exact commands used
  (e.g., `darwin-rebuild build ...`), and links to related issues.

## Security & Configuration Tips

- Secrets via `sops-nix`: edit with `sops home/.env.sops`; never hardcode credentials.
- Environment proxies are managed in `home/home.nix`;
  avoid duplicating proxy settings elsewhere.
