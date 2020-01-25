# My dotfiles
This is a repository containing some of my important configuration files. They will slowly develop over time as I learn.

## Requirements
There are certain packages and/or repositories that are used by these dotfiles. It is recommended to install them first.

| Package/Repository      | Purpose              | Used By       |
|-------------------------|----------------------|---------------|
| [microsoft/cascadia-code](https://github.com/microsoft/cascadia-code) | Font | (config.rosi) |
| rofi                    | App launcher         | (config.rasi) |
| tmux                    | Terminal multiplexer | (tmux.conf)   |
| vim                     | Text editor          | (vimrc)       |
| zsh                     | Shell                | (zshrc)       |
| zsh-syntax-highlighting | Shell                | (zshrc)       |

## Installation
I prefer to keep my repository separate from any other files that I may need or want to keep secret. For that reason, the dotfiles are all symlinked to their usual path.

The script performs the following actions:
* Symlink: Remove if found
* File: Backup if found
* Path: Create if not found
* Create Symlinks for the dotfiles to their appropriate paths

To use the script, simply run it without any arguments. Ensure that the script remains in the dotfiles folder as it links relative to its location.
