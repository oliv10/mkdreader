# mkdreader

`mkdreader` is a standalone Markdown viewer with micro-like movement keys.

## Why

You wanted a `glow`-style Markdown reading experience without depending on `glow`, and with keybindings closer to `micro`.

## Requirements

- Python 3.8+
- Optional: `less` + `lesskey` (for interactive paging)

If `less`/`lesskey` are unavailable, `mkdreader` still works and prints rendered output directly.

## Usage

```bash
./mkdreader README.md
./mkdreader docs/
cat README.md | ./mkdreader
./mkdreader README.md --no-pager
```

When run with no file argument in a terminal, `mkdreader` opens a file selector for `.md` files in the current directory. If you pass a directory (for example `./mkdreader docs/`), it opens the selector for that directory.

Selector keys:

- `Ctrl+N` / `j` / `Down`: next file
- `Ctrl+P` / `k` / `Up`: previous file
- `Ctrl+F`: page down
- `Ctrl+B`: page up
- `g`: top
- `G`: bottom
- `Enter`: open selected file
- `q`: quit selector

## Keybinds (pager mode)

- `Ctrl+N` or `j`: next line
- `Ctrl+P` or `k`: previous line
- `Ctrl+F`: next page
- `Ctrl+B`: previous page
- `Ctrl+D`: half-page down
- `Ctrl+U`: half-page up
- `g`: top
- `G`: bottom
- `q`: quit

## Install (optional)

```bash
install -m 755 mkdreader ~/.local/bin/mkdreader
```

## Homebrew (tap package)

This repo now includes a Homebrew formula at `Formula/mkdreader.rb` with dependencies:

- `python@3.12`
- `less` (on Linux; uses system `less` on macOS)

To publish and update the formula automatically:

1. Open `Actions` -> `Publish Release and Homebrew Bottles`.
2. Click `Run workflow`.
3. Set:
   - `version` (for example `v0.1.0`)
   - `target_branch` (`main`)
4. The workflow will:
   - create the GitHub release (if missing)
   - build Linux and macOS bottles
   - upload those bottles to the GitHub release
   - compute source tarball `sha256`
   - open a PR updating `Formula/mkdreader.rb` with source + bottle metadata
   - request auto-merge for that PR
5. Install without local build:

```bash
brew tap oliv10/mkdreader
brew install --force-bottle oliv10/mkdreader/mkdreader
```

### GitHub Repo Configuration (Required)

To run this without manual intervention beyond starting the workflow:

- In `Settings` -> `Actions` -> `General`:
  - Set `Workflow permissions` to `Read and write permissions`.
  - Enable `Allow GitHub Actions to create and approve pull requests`.
- In `Settings` -> `General` (Pull Requests section):
  - Enable `Allow auto-merge`.
- If branch protection is enabled on `main`:
  - Do not require PR reviews for this automation path when using `GITHUB_TOKEN`.
  - Any required status checks must pass for auto-merge to complete.
- If your repository is private and you install from another machine:
  - Ensure that machine has access to release assets and tap repo over SSH.

If you must keep required reviews, use a separate bot account token with bypass permissions instead of `GITHUB_TOKEN`.

## Tip

If you install globally, ensure `~/.local/bin` is in your `PATH`.
