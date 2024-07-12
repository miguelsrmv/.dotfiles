# .dotfile backup for all currently used tools

## 1st step:
### To clone all repositores:
    git clone --recurse-submodules git@github.com:miguelsrmv/.dotfiles.git
### If main repository already exists
git submodule update --init --recursive

## 2nd step:
### Stow every desired package
    eg: stow nvim
