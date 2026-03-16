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

## Tip

If you install globally, ensure `~/.local/bin` is in your `PATH`.
