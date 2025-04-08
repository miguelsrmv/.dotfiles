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

# Aliases
alias pacman="sudo pacman"
alias ls="ls --color=auto"

# Fix wrong Home/End/Del/Insert bindings
bindkey -e
bindkey "^[[H" beginning-of-line    # Home key
bindkey "^[[F" end-of-line          # End key
bindkey "^[[2~" overwrite-mode      # Insert key
bindkey "^[[3~" delete-char         # Delete key

# Start starship prompt
eval "$(starship init zsh)"

# Created by `pipx` on 2025-03-31 11:24:15
export PATH="$PATH:/home/miguel/.local/bin"
