# LazyVim Ubuntu installer — AGENTS.md

## What this is

Sets up [LazyVim](https://www.lazyvim.org) on Ubuntu.
Also prepares LazyVim for [Ruby](https://www.ruby-lang.org/en/) development.

## Promises

- **Distro packages first.** Everything comes from Ubuntu's apt, snap only where apt's is too old; a direct download only when no package exists.
- **One command on a fresh machine.** `./install` takes a stock Ubuntu 25.10+ to a working LazyVim + Ruby setup.
- **amd64 and arm64 alike.** Nothing architecture-specific; a Raspberry Pi 5 is a first-class target.

## Design docs

| File | Owns | Loaded |
|---|---|---|
| `README.md` | the pitch, requirements, install steps, the post-install LazyVim steps | — |
| `AGENTS.md` (this) | promises, invariants, the module map, conventions, commands | every turn |
| script comments | why one step is done the way it is | at the step |

Every fact lives in exactly one of these; the others link to it.

## Invariants

- **Scripts run from the repo root.** They reach siblings by relative path (`./install-fonts`, `cp *.lua`, `cp -r seeds/.`); from elsewhere they fail or copy nothing.
- **Each `install-*` runs standalone and is safe to re-run.** It either skips what is already installed or wipes its own state and redoes it; `install` only chains them.
- **Every top-level `*.lua` is a LazyVim plugin spec.** `install-lazyvim` copies `*.lua` into `~/.config/nvim/lua/plugins/` wholesale.

## Module map

- `install` — runs fonts, Alacritty, Ruby, LazyVim, in that order.
- `install-fonts` — UbuntuMono and JetBrainsMono Nerd Fonts into `~/.local/share/fonts`.
- `install-alacritty` — fonts, Alacritty from apt, the alacritty-theme repo, `seeds/` into `~`, Alacritty as the default terminal, removes gnome-terminal and ptyxis; exits 1 after a fresh install so `install` stops until rerun inside Alacritty.
- `install-ruby` — skipped when Ruby is present; else wipes `~/.gem`, apt Ruby plus the headers and toolchain gems build against.
- `install-lazyvim` — wipes all NeoVim state; apt tools, snap NeoVim, the LazyVim starter, our `*.lua`, the enabled extras written into `lazyvim.json`.
- `*.lua` — LazyVim plugin overrides: colorscheme, snacks explorer and lazygit.
- `seeds/` — dotfiles mirroring `$HOME`, copied verbatim; today the Alacritty config and `xdg-terminals.list`.

## Conventions

- **Bash, `#!/bin/bash` and `set -e -o pipefail`** at the top of every script.
- **Progress is `echo -e "\n* <step>"`**; a step allowed to fail ends in `|| echo "* WARN: <what> but continuing"`.
- **Colours match: catppuccin latte** in both the Alacritty seed and `colorscheme.lua`.

## Commands

- `./install-alacritty`, then `./install` inside Alacritty — everything; run from the repo root. No tests, no CI.
- `./install-fonts`, `./install-alacritty`, `./install-ruby`, `./install-lazyvim` — one part.

## Maintenance of this file

Loaded every turn; cap 34 KB, a module's own `AGENTS.md` 10 KB. Over it, in this order:
delete what has no home — status, history, class lists, what the code already says; trim
each line to its fact plus one clause and send the explanation home — why →
`design/decisions.md`, how across symbols → `design/architecture.md`, how in one symbol →
its doc comment, what upstream does → `design/research.md`; only then a module's own
`AGENTS.md`, peripheral modules first, never the core. Never paraphrase a lazy entry into a
line here.
