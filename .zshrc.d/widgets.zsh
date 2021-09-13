# Edit the current command in your $EDITOR with esc,v

bindkey -v

bindkey '^r' history-incremental-search-backward

autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line




# do I care about these?

# bindkey '^a' beginning-of-line
# bindkey '^e' end-of-line
# # Also fix annoying vi backspace
# bindkey '^?' backward-delete-char