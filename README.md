# LazyVim Ubuntu installer

Sets up [LazyVim](https://www.lazyvim.org) on Ubuntu.
Also prepares LazyVim for [Ruby](https://www.ruby-lang.org/en/) development.

Requirements:

- Ubuntu 26.04 or newer
- Both x86-64 (amd64) and arm64 works (tested on Ubuntu 25.10 for Raspberry PI 5)

## Installation procedure:

> [!WARNING]
> This deletes your existing NeoVim setup: `~/.config/nvim`, `~/.cache/nvim`, `~/.local/share/nvim`
> and `~/.local/state/nvim`. When Ruby isn't installed yet it also deletes `~/.gem`, and when
> Alacritty isn't installed yet it overwrites `~/.config/alacritty/alacritty.toml`.

Run the scripts from this directory:

- Run `./install-alacritty` to install the Alacritty terminal, make it the default terminal and uninstall gnome-terminal and ptyxis.
- Close this terminal and open Alacritty, so that the fonts and the theme activate.
- In Alacritty, run `./install`

## What this does

In the order the scripts run:

- Installs [Nerd Fonts](https://www.nerdfonts.com/) UbuntuMono and JetBrainsMono, which LazyVim needs to display all icons properly.
- Installs the Alacritty terminal and makes it the default terminal
  - JetBrainsMono Nerd Font, the catppuccin-latte theme
  - Ctrl+Alt+T, "Open in Terminal" and the dock icon open Alacritty
  - Uninstalls gnome-terminal and ptyxis
- Prepares NeoVim for Ruby development
  - Installs [Ruby](https://mvysny.github.io/ruby/) from apt; gems go to `~/.gem`
  - Installs other packages so that gems install and update successfully
- Installs [NeoVim](https://neovim.io/) from snap, which is newer than the one in apt.
  - Uninstalls apt NeoVim if installed
  - Installs LazyGit and the LazyVim dependencies: fzf, ripgrep, fd-find, luarocks
- Sets up LazyVim from the [LazyVim starter](https://github.com/LazyVim/starter)
  - The catppuccin-latte theme, fullscreen LazyGit

## Once the script finishes

- Run `nvim` from the Alacritty terminal and wait for it to install LazyVim
- Restart `nvim` - you're welcomed by the LazyVim welcome screen.
- Type in `:LazyHealth` to check everything's okay
- Install LazyVim/Ruby:
  - open Lazy Extras by pressing `x` on the main LazyVim screen
  - Search for and install `lang.ruby`, by pressing `x` inside the `()` icon
    - More info: [LazyVim Ruby](https://www.lazyvim.org/extras/lang/ruby)
  - Add support for tests: install `test.core`
  - Install `coding.mini-surround` to enable `gsr'"` to turn Ruby `'string'` into `"string"`
  - Install `lang.java` for Java support, `dap.core`  for debugging

# Further reading

- [LazyVim for Ambitious Developers](https://lazyvim-ambitious-devs.phillips.codes/) does an excellent job explaining
  in layman's terms how LazyVim works. A great introduction to LazyVim, read this first.
- [Moving Blazingly Fast With The Core Vim Motions](https://www.barbarianmeetscoding.com/boost-your-coding-fu-with-vscode-and-vim/moving-blazingly-fast-with-the-core-vim-motions/)
  to learn how to work with Vim, when you're ready to ditch the mouse.
  - When you're ready to step up your vim game: [Practical Vim](https://pragprog.com/titles/dnvim2/practical-vim-second-edition/)
- [LazyVim for Intellij IDEA developers](https://mvysny.github.io/lazyvim-for-idea-devs/) - if you already
  know IDEA, this will help you learn LazyVim the IDE part faster.


