# Autocomplete
autoload -Uz compinit
compinit
# Ignore case on autocomplete
zstyle ":completion:*" matcher-list "m:{A-Za-z}={a-zA-Z}"

# Disables the annoying beep sound
unsetopt BEEP

export PROMPT="%(!.%K{#d6691c} #.%K{#0c7ff2}) %1~%f %k%(!.%F{#d6691c}.%F{#0c7ff2})🭬%f "

# Shortcuts
alias su="sudo -E zsh"
alias sp="sudo pacman"
alias q="exit"
alias cl="clear"
alias hx="helix"
alias open="xdg-open"
alias cmd="nohup foot 1>/dev/null 2>/dev/null &"
alias temp="paste <(cat /sys/class/thermal/thermal_zone*/type) <(cat /sys/class/thermal/thermal_zone*/temp) | column -s $'\t' -t | sed 's/\(.\)..$/.\1°C/'"
alias py="python"
alias poff="poweroff"
alias poffr="poweroff --reboot"

# Default options
alias ls="ls --color=auto -A -v"
alias tree="tree -C --gitignore --filesfirst"
alias less="less -R"

# History config
# https://martinheinz.dev/blog/110

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000

HISTORY_IGNORE="(ls|cd|pwd|exit|cp|mv|rm)*"

setopt EXTENDED_HISTORY      # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY    # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY         # Share history between all sessions.
setopt HIST_IGNORE_DUPS      # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS  # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_SPACE     # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS     # Do not write a duplicate event to the history file.
setopt HIST_VERIFY           # Do not execute immediately upon history expansion.
setopt APPEND_HISTORY        # append to history file (Default)
setopt HIST_NO_STORE         # Don't store history commands
setopt HIST_REDUCE_BLANKS    # Remove superfluous blanks from each command line being added to the history.
