# LazyVim Ubuntu installer

Sets up [LazyVim](https://www.lazyvim.org) on Ubuntu.
Also prepares LazyVim for Ruby development.

Requirements:

- Ubuntu 25.10 or newer

## Installation procedure:

To install everything, including the terminal:

- Run `./install`

To install just the *Alacritty* terminal:

- Run `./install-term`
- Uninstall `gnome-terminal`

## What this does

- Installs NeoVim from snap, which is newer than the one in apt.
  - Uninstalls apt NeoVim if installed
- Prepares NeoVim for Ruby development
  - Installs [Mise](https://mise.jdx.dev/lang/ruby.html) which manages installed Ruby instances.
  - Installs nodejs and Ruby via Mise
  - Installs `build-essentials` and other packages so that Ruby and gems install successfully
- Installs the Alacritty terminal
  - Also installs [Nerd Fonts](https://www.nerdfonts.com/) which is required by LazyVim to display all icons properly.

## Once the script finishes

- Close this terminal and open a new one (Alacritty), so that Mise activates"
- (Optional) uninstall gnome-terminal and only keep Alacritty"
- Run `nvim` from the Alacritty terminal and wait for it to install LazyVim
- Restart `nvim` - you're welcomed by the LazyVim welcome screen.
- Type in `:LazyHealth` to check everything's okay
- Install LazyVim/Ruby:
  - open Lazy Extras by pressing `x` on the main LazyVim screen
  - Search for and install `lang.ruby`, by pressing `x` inside the `()` icon
  - More info: [LazyVim Ruby](https://www.lazyvim.org/extras/lang/ruby)

# Further reading

- [LazyVim for Ambitious Developers](https://lazyvim-ambitious-devs.phillips.codes/) does an excellent job explaining
  in layman's terms how LazyVim works. A great introduction to LazyVim, read this first.
- [Moving Blazingly Fast With The Core Vim Motions](https://www.barbarianmeetscoding.com/boost-your-coding-fu-with-vscode-and-vim/moving-blazingly-fast-with-the-core-vim-motions/)
  to learn how to work with Vim, when you're ready to ditch the mouse.
  - When you're ready to step up your vim game: [Practical Vim](https://pragprog.com/titles/dnvim2/practical-vim-second-edition/)
- TODO LazyVim for Intellij IDEA developers (I'll write this blogpost soon)

