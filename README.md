# better-glow

`better-glow` is a tiny wrapper around [glow](https://github.com/charmbracelet/glow) that keeps glow's Markdown rendering and replaces paging keybinds with a micro-like set.

## Why

`glow` renders Markdown nicely, but its interactive bindings may not match your muscle memory. This wrapper renders with `glow -p` and pages in `less` with a custom `lesskey` map.

## Requirements

- `glow`
- `less`
- `lesskey`

## Usage

```bash
./better-glow README.md
./better-glow docs/*.md
cat README.md | ./better-glow
```

Everything after `better-glow` is forwarded to `glow`.

## Keybinds

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
install -m 755 better-glow ~/.local/bin/better-glow
```

Make sure `~/.local/bin` is in your `PATH`.
