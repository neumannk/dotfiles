# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
case "$(uname -s)" in
    Darwin) export ZSH="/Users/$USER/.oh-my-zsh";;
    Linux)  export ZSH="/home/$USER/.oh-my-zsh";;
esac

# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"


# Sublime plugin:
# st: open Sublime Text, optionally with a given file or directory
# stt: open Sublime Text on the current directory.
# sst: if sudo is available, open Sublime Text with root permissions
plugins=(sublime sudo git colored-man-pages shrink-path )

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='nano'
fi

# Source all the files in ~/.zshrc.d.
for file in $(find ~/.zshrc.d/**/*.zsh -type f); do
    source "$file"
done
