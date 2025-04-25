# Update Hostname
export HOSTNAME=$(cat /etc/hostname)

# Load environment variables from ~/.env file
if [ -f "$HOME/.env" ]; then
   export $(grep -v '^#' $HOME/.env | xargs)
fi

# Setup history
# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/dotfiles/zsh/.zsh_history

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "wintermi/zsh-starship"

# Load and initialise completion system
autoload -Uz compinit
compinit -C

# Aliases
alias pacman="sudo pacman"
alias ls="ls --color=auto"

# PATH Update
export PATH="$PATH:/home/miguel/.local/bin"

# Update Manpage viewer
export MANPAGER='nvim +Man!'

# Fix wrong Home/End/Del/Insert bindings
bindkey -e
bindkey "^[[H" beginning-of-line    # Home key
bindkey "^[[F" end-of-line          # End key
bindkey "^[[2~" overwrite-mode      # Insert key
bindkey "^[[3~" delete-char         # Delete key

# Start starship prompt
eval "$(starship init zsh)"
