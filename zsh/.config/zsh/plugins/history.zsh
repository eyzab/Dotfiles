if zstyle -T ":history" use-xdg-dirs; then
  _data_dir=${XDG_DATA_HOME:-$HOME/.local/share}/zsh
  [[ -d "$_data_dir" ]] || mkdir -p "$_data_dir"

  _history="$_data_dir/zhistory"
else
  _history="${ZDOTDIR:-$HOME}/.zhistory"
fi

HISTFILE="$_history"
HISTSIZE=50000
SAVEHIST=50000

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.

unset _history _data_dir
