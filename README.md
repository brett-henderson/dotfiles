# My dotfiles
This is a repository containing some of my important configuration files. They will slowly develop over time as I learn.

## Requirements
There are certain packages and/or repositories that are used by these dotfiles. It is recommended to install them first.

| Package/Repository      | Purpose              | Relevent configs      |
|-------------------------|----------------------|-----------------------|
| xcompmgr                | Compositor           | (xsession)            |
| noto sans               | Font                 | (xmonad.hs, xmobarrc) |
| tmux                    | Terminal multiplexer | (tmux.conf)           |
| vim                     | Text editor          | (vimrc)               |
| XDM                     | Display manager      | (Xresources, xsession)|
| xmobar                  | Status bar           | (xmobarrc)            |
| xmonad                  | Window manager       | (xmonad.hs)           |
| xorg                    | Display server       | (Xresources, xsession)|
| zsh                     | Shell                | (zshrc)               |
| zsh-syntax-highlighting | Shell                | (zshrc)               |

## Installation
I prefer to keep my repository separate from any other files that I may need or want to keep secret. For that reason, the dotfiles are all symlinked to their usual path.

The script performs the following actions:
* Symlink: Remove if found
* File: Backup if found
* Path: Create if not found
* Create new symlinks for the dotfiles to their appropriate paths

To use the script, first uncomment the desired config files and confirm their paths. Then run the script (unprivileged) without arguments. Ensure that the script remains in the dotfiles folder as links are relative.

Also note that for using the xsessions file with XDM, it needs to be executable.

