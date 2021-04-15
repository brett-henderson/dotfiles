########################################################################
#	ALIAS
########################################################################
alias grep='grep --color=auto'
alias ls='ls --color=auto -F'
alias ll='ls -lhA'
alias la='ls -A'
alias reload='source $HOME/.zshrc'
alias sudo='sudo ' # Allow sudo for aliases
alias tree='tree -C'

########################################################################
#	Completion
########################################################################
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' menu select=1
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose true
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit

########################################################################
#	Environment
########################################################################
typeset -U PATH path
path=("/usr/local/bin" "/usr/bin" "/bin" "/usr/local/sbin" "/usr/bin/site_perl" "/usr/bin/vendor_perl" "/usr/bin/core_perl" "$HOME/go/bin" "$HOME/dotnet")
export PATH
export EDITOR="vim"
export DOTNET_ROOT="$HOME/dotnet"
export MSBuildSDKsPath="$DOTNET_ROOT/sdk/$(${DOTNET_ROOT}/dotnet --version)/Sdks"

########################################################################
#	History
########################################################################
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

########################################################################
#	MISC
########################################################################
bindkey -e # Emacs keybindings for CLI because $EDITOR is set to "vim"

########################################################################
#	PROMPT
########################################################################
autoload -Uz promptinit
promptinit

PS1='%B%F{blue}%n@%m%f %F{magenta}%~%f %F{blue}>%f%b '
RPS1='%B%F{magenta}[%D{%d %B, %Y} - %t]%f%b'

# Fish-like shell syntax highlighting (must install zsh-syntax-highlighting)
source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

