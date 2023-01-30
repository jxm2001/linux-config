export TERM="xterm-256color"
export LC_ALL=C.UTF-8
export LANG=C.UTF-8
export PATH=$HOME/.local/bin:$PATH

# history setting
HISTFILE=~/.zhistory
HISTSIZE=5000
SAVEHIST=5000

# plugins
source ~/.zsh/themes/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-completions/zsh-completions.plugin.zsh
source ~/.zsh/plugins/z/z.sh

# completions setting
setopt AUTO_LIST
setopt AUTO_MENU
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
# enable completion 
autoload -U compinit
compinit

# make zsh compatible with *
setopt no_nomatch

# alias setting
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -la'
