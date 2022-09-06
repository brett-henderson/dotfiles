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

autoload -Uz compinit && compinit

########################################################################
#	Environment
########################################################################
typeset -U PATH path
# TODO: Make path assignment less destructive.
path=("/usr/local/sbin" "/usr/local/bin" "/usr/sbin" "/usr/bin" "/sbin" "/bin")
export PATH
export EDITOR='vim'

# Keeping for now. Don't remember why I needed this.
#export DOTNET_ROOT="$HOME/dotnet"
#export MSBuildSDKsPath="$DOTNET_ROOT/sdk/$(${DOTNET_ROOT}/dotnet --version)/Sdks"

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
bindkey -e # Emacs keybindings for CLI because $EDITOR is set to vim

########################################################################
#	PROMPT
########################################################################
autoload -Uz vcs_info
precmd() { vcs_info }
setopt PROMPT_SUBST

zstyle ':vcs_info:git:*' formats '%F{027}[%f%F{171}%b%f%F{027}]%f'

# Todo: Add variables for colors to ease visibility
# ToDo: Work in this line from another zshrc to change color if root user
#if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi

PROMPT='%B%F{027}%n@%m%f %F{171}%~%f %F{027}>%f%b '
RPROMPT='${vcs_info_msg_0_}'

# Fish-like shell syntax highlighting (must install zsh-syntax-highlighting)
arch_zsh='/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
debian_zsh='/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
[[ -f $arch_zsh ]] && source $arch_zsh
[[ -f $debian_zsh ]] && source $debian_zsh
