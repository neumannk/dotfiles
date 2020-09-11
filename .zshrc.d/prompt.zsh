###########################################################
# hostname
###########################################################
PROMPT_HOST=$(hostname)
for file in $(find ~/.zshrc.d/**/ -name hostname-overrides.csv); do
    PROMPT_HOST_OVERRIDE=$(awk -F, -v host="$PROMPT_HOST" '$1 == host { print $2; exit }' "$file")
done
PROMPT_HOST="${PROMPT_HOST_OVERRIDE:-"$PROMPT_HOST"}"

###########################################################
# git
###########################################################
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

###########################################################
# command time
###########################################################
_command_time_preexec() {
    timer=${timer:-$SECONDS}
    export ZSH_COMMAND_TIME=""
}

_command_time_precmd() {
    if [ $timer ]; then
        timer_show=$(($SECONDS - $timer))
        if [ -n "$TTY" ] && [ $timer_show -ge 10 ]; then
            if [ -n "$timer_show" ]; then
                if [ $timer_show -ge 60 ]; then
                    timer_show=$(printf '%dm%ds\n' $(($timer_show/60)) $(($timer_show%60)))
                else
                    timer_show=$(printf '%ds\n' $(($timer_show%60)))
                fi
                export ZSH_COMMAND_TIME="%F{cyan}$(printf "%s\n" "$timer_show")%f"
            fi
        fi
        unset timer
    fi
}

###########################################################
# functions
###########################################################
precmd_functions+=(_command_time_precmd)
preexec_functions+=(_command_time_preexec)

###########################################################
# prompt
###########################################################
setopt prompt_subst
PROMPT='%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )'
PROMPT+='${PROMPT_HOST}:'
PROMPT+='%{$fg[cyan]%}$(shrink_path -f)%{$reset_color%} '
PROMPT+='$(git_prompt_info)'

RPROMPT='$ZSH_COMMAND_TIME'
