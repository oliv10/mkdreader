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

To publish it as a tap package:

1. Push this project to GitHub (`oliv10/mkdreader`).
2. Create a release tag from `main` (for example `v0.1.0`):

```bash
git checkout main
git pull --ff-only
git tag v0.1.0
git push origin v0.1.0
```

3. Download the release tarball and compute SHA256:

```bash
curl -L -o mkdreader-v0.1.0.tar.gz \
  https://github.com/oliv10/mkdreader/archive/refs/tags/v0.1.0.tar.gz
shasum -a 256 mkdreader-v0.1.0.tar.gz
```

4. Update `homepage`, `url`, and `sha256` in `Formula/mkdreader.rb`.
5. Put the formula in a tap repo (typically `homebrew-mkdreader`) and install:

```bash
brew tap oliv10/mkdreader
brew install mkdreader
```

### Automate Formula Updates (GitHub Actions)

This repo includes a workflow at `.github/workflows/update-homebrew-formula.yml` that:

- takes a tag (for example `v0.1.0`) from a manual run, or from a published GitHub release
- downloads the release tarball
- computes `sha256`
- updates `Formula/mkdreader.rb`
- opens a pull request with the formula change

Requirements:

- GitHub Actions enabled for the repo
- Workflow permissions allowing `GITHUB_TOKEN` to read/write repository contents
- The workflow job needs:
  - `contents: write`
  - `pull-requests: write`
- A real release tag that exists on GitHub (for example `v0.1.0`)

Manual run:

1. Open `Actions` -> `Update Homebrew Formula`.
2. Click `Run workflow`.
3. Set `version` to a tag like `v0.1.0`.
4. Merge the generated PR.

## Tip

If you install globally, ensure `~/.local/bin` is in your `PATH`.
