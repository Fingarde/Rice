# THEME_DIRECTORY="%F{213}"
# THEME_SPACER="%F{105}"
# THEME_HOSTNAME="%F{228}"
# THEME_BREAKER="%F{237}"

# export PS1="$THEME_BREAKER${(l.COLUMNS..-.)}$THEME_DIRECTORY%~$THEME_SPACER » %f"
# export RPS1="$THEME_HOSTNAME%n@%m%f"


if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# primary prompt
PROMPT='$FG[237]${(l.COLUMNS..-.)}%{$reset_color%}
$FG[213]%~\
$(git_prompt_info)$(hg_prompt_info) \
$FG[105]%(!.#.»)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'


# color vars
eval my_gray='$FG[228]'
eval my_orange='$FG[214]'

# right prompt
if type "virtualenv_prompt_info" > /dev/null
then
	RPROMPT='$FG[078]$(virtualenv_prompt_info)%{$reset_color%} $my_gray%n@%m%{$reset_color%}%'
else
	RPROMPT='$my_gray%n@%m%{$reset_color%}%'
fi

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075]($FG[078]"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"

# hg settings
ZSH_THEME_HG_PROMPT_PREFIX="$FG[075]($FG[078]"
ZSH_THEME_HG_PROMPT_CLEAN=""
ZSH_THEME_HG_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_HG_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"


THEME_DIRECTORY="%F{213}"
THEME_SPACER="%F{105}"
THEME_HOSTNAME="%F{228}"
THEME_BREAKER="%F{237}"

export PS1="$THEME_BREAKER${(l.COLUMNS..-.)}$THEME_DIRECTORY%~$THEME_SPACER » %f"
export RPS1="$THEME_HOSTNAME%n@%m%f"