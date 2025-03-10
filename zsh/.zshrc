# Update Hostname
export HOSTNAME=$(cat /etc/hostname)

# Load environment variables from .env file
if [ -f "$HOME/.env" ]; then
   export $(grep -v '^#' $HOME/.env | xargs)
fi

#Aliases
alias pacman="sudo pacman"

# Fix wrong Home/End/Del/Insert bindings
bindkey -e
bindkey "^[[H" beginning-of-line    # Home key
bindkey "^[[F" end-of-line          # End key
bindkey "^[[2~" overwrite-mode      # Insert key
bindkey "^[[3~" delete-char         # Delete key

# Start starship
eval "$(starship init zsh)"
