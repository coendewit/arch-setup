# Measure startup time
start_time=$(date +%s.%3N)

export ZSH=$HOME/.oh-my-zsh

#
# Only run fastfetch if not on a Linux console
case "$TTY" in
  /dev/tty[0-9]*) 
    # On a real TTY -> skip fastfetch
    ;;
  *)
    # On a PTY (Wayland/X11 terminal emulator) -> run fastfetch
    fastfetch
    ;;
esac

ZSH_THEME="my-arch-theme"

# Enable plugins
plugins=(git dotnet zsh-autosuggestions zsh-syntax-highlighting zsh-completions vi-mode)

# Enable colors
autoload -U colors && colors

COMPLETION_WAITING_DOTS="true"

# Source Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# Store command start time
preexec() { timer=$EPOCHSECONDS }

# Update right prompt with elapsed time
precmd() {
  if [[ -n $timer ]]; then
    local elapsed=$((EPOCHSECONDS - timer))
      RPROMPT="%F{green}${elapsed}s%f"
  else
    RPROMPT=""
  fi
}

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Set up make
m() {
    local git_root
    git_root=$(git rev-parse --show-toplevel 2>/dev/null)

    if [[ -n "$git_root" ]]; then
        echo "Running make in Git root: $git_root"
        make -C "$git_root" --no-print-directory "$@"
    else
        echo "Running make in current directory: $PWD"
        make --no-print-directory "$@"
    fi
}

# Set up aliases
alias l="eza -la --group-directories-first --icons=auto"
alias ls="eza -la --group-directories-first --icons=auto"
alias lg="lazygit"
alias n="nvim"

# Initialize zoxide
eval "$(zoxide init zsh)"

# Set up dotnet
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools

# Set up ASP.NET Core dev certs 
export SSL_CERT_DIR=$HOME/.aspnet/dev-certs/trust:/etc/ssl/certs

# Setup spatialite for geospatial data for testing
export LD_LIBRARY_PATH=/usr/local/lib:/usr/lib

# Added by get-aspire-cli.sh
export PATH="$HOME/.aspire/bin:$PATH"

# Display startup time
end_time=$(date +%s.%3N)
elapsed=$(awk "BEGIN {printf \"%.3f\", $end_time - $start_time}")
echo "Shell startup time: ${elapsed}s"
