# Dots

## Setting Up GNU Stow

1. create new directory in home: `mkdir $HOME/dots`
2. Copy over files you want to stow. It's important your new
   directory is laid out the same as the files would be in `$HOME`
3. Install stow onto our system: `brew install stow`
4. Inside our new `dots/` directory, set-up symlink via the command:
   `stow .`

### Sources:

[GNU Stow](https://www.gnu.org/software/stow/)
[Stow has forever changed the way I manage my dotfiles | Dreams of Autonomy](https://www.youtube.com/watch?v=y6XCebnB9gs)
