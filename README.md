# Dots

## To-Do

- [ ] Brewfile
- [ ] Document System Preferences adjustments
- [ ] Update README with walkthrough of setup
- [ ] Add RetroArch config
- [ ] Add Obisidan Setup

## Setting Up GNU Stow

1. create new directory in home: `mkdir $HOME/dots`
2. Copy over files you want to stow. It's important your new
   directory is laid out the same as the files would be in `$HOME`
3. Install stow onto our system: `brew install stow`
4. Inside our new `dots/` directory, set-up symlink via the command:
   `stow .`

## Inspired By

- [jessarcher](https://github.com/jessarcher/dotfiles)
- [hectron](https://github.com/hectron/dotfiles)
- [natw](https://github.com/natw/dotfiles)
- [craftzdog](https://github.com/craftzdog/dotfiles-public)
- [josean-dev](https://github.com/josean-dev/dev-environment-files)

## Resources

- [macOS Setup Guide](https://sourabhbajaj.com/mac-setup/)
- [Homebrew/homebrew-bundle](https://github.com/Homebrew/homebrew-bundle)
- [Homebrew Formulae](https://formulae.brew.sh/)
- [Connecting to GitHub with SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
- [The best way to store your dotfiles: A bare Git repository **EXPLAINED**](https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/)
- [NeoVim from Scratch - chris@machine](https://www.youtube.com/playlist?list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ)
- [A Quick and Easy Guide to tmux](https://www.hamvocke.com/blog/a-quick-and-easy-guide-to-tmux/)
- [GNU Stow](https://www.gnu.org/software/stow/)
- [Stow has forever changed the way I manage my dotfiles | Dreams of Autonomy](https://www.youtube.com/watch?v=y6XCebnB9gs)
