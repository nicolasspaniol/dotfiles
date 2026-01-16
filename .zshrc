# General settings ------------------------------------------------------------

export PATH="$HOME/.cargo/bin:$HOME/.elan/bin:$HOME/.local/bin:$PATH"

export EDITOR=helix

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^Y" edit-command-line

# Autocomplete
autoload -Uz compinit
compinit
# Ignore case on autocomplete
zstyle ":completion:*" matcher-list "m:{A-Za-z}={a-zA-Z}"

# Disables the annoying beep sound
unsetopt BEEP

# Necessary over SSH
# https://stackoverflow.com/a/57805911/12712114
export TERM=xterm

[[ $SSH_CONNECTION ]] && local sship="$(echo $SSH_CONNECTION | cut -d ' ' -f3):"
local orange="#d6691c"
local blue="#0c7ff2"
export PROMPT="%(!.%K{$orange} #.%K{$blue}) $sship%1~%f %k%(!.%F{$orange}.%F{$blue})🭬%f "

# Aliases and functions -------------------------------------------------------

# Shortcuts
alias su="sudo -E zsh"
alias sp="sudo pacman"
alias q="exit"
alias cl="clear"
alias hx="helix"
alias open="xdg-open"
alias py="$(command -v python || command -v python3)"
alias poff="poweroff"
alias hpoff="systemctl hibernate"
alias rpoff="reboot"
alias venv="source .venv/bin/activate" # Because I use too much Python
alias ur="uv run"
alias gs="git status"
alias xp="xplr"
# Opens foot in another process without displaying any message
[[ ! $SSH_CONNECTION ]] && alias cmd="read < <(nohup foot > /dev/null 2>&1 &)"

# Default options
alias ls="ls --color=auto -A -v --group-directories-first"
alias tree="tree -C --filesfirst"
alias less="less -R"
# The space at the end is necessary for keeping the aliases functional
# https://unix.stackexchange.com/a/349290
alias sudo="sudo -E "
alias fd="fd -I "
alias rg="rg -p --no-ignore"

# https://www.stefanjudis.com/snippets/a-native-shell-alternative-to-the-trash-cli/
trash() { mv "$@" "$HOME/.local/share/Trash" }
trashcl() { rm -fr "$HOME"/.local/share/Trash/* }
trashls() { ls "$HOME/.local/share/Trash" }

# Keyboard bindings -----------------------------------------------------------

# Unbind up/down keys to get me used to navigating the history with Ctrl+P / N
bindkey -r "^[[A"
bindkey -r "^[[B"

bindkey "^F" forward-word
bindkey "^B" backward-word

# History ---------------------------------------------------------------------

# History config
# https://martinheinz.dev/blog/110

HISTFILE="$HOME/.hist_zsh"
HISTSIZE=10000000
SAVEHIST=10000000

HISTORY_IGNORE="(ls|cd|pwd|exit)*"

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
