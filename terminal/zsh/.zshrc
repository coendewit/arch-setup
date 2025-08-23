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

ENABLE_CORRECTION="true"
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

alias l="eza -la --group-directories-first --icons=auto"
alias ls="eza -la --group-directories-first --icons=auto"
alias lg="lazygit"
alias n="nvim"

eval "$(zoxide init zsh)"

export PATH="$HOME/.local/bin:$PATH"

if uwsm check may-start; then
  exec uwsm start hyprland-uwsm.desktop
fi
