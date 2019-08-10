# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/nopain/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

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

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git virtualenv virtualenvwrapper fast-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# If not running interactively, don't do anything

# source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme

# Powerlevel9k config

## PROMPT
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='%F{#B39FD5}#'
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{#94D183}$%F{#a5b1c2} "
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=''
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv custom_os_icon ssh root_indicator dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time status)

## VIRTUALENV
POWERLEVEL9K_VIRTUALENV_BACKGROUND='none'
POWERLEVEL9K_VIRTUALENV_FOREGROUND='white'
POWERLEVEL9K_VIRTUALENV_LEFT_DELIMITER='('
POWERLEVEL9K_VIRTUALENV_RIGHT_DELIMITER=')'
POWERLEVEL9K_VIRTUALENV_VISUAL_IDENTIFIER_COLOR='white'
POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=false

## CMD EXECUTION
# POWERLEVEL9K_EXECUTION_TIME_ICON=" "
POWERLEVEL9K_EXECUTION_TIME_ICON=''
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND="none"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND="#FCBDAB"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0

## DIR
# POWERLEVEL9K_HOME_ICON=" "
POWERLEVEL9K_HOME_ICON=''
# POWERLEVEL9K_HOME_SUB_ICON=" "
POWERLEVEL9K_HOME_SUB_ICON=''
# POWERLEVEL9K_FOLDER_ICON=" "
POWERLEVEL9K_FOLDER_ICON=''
# POWERLEVEL9K_ETC_ICON="\ue5fc "
POWERLEVEL9K_ETC_ICON=''
POWERLEVEL9K_DIR_ETC_BACKGROUND='none'
POWERLEVEL9K_DIR_ETC_FOREGROUND='#71BBEE'
POWERLEVEL9K_DIR_HOME_BACKGROUND='none'
POWERLEVEL9K_DIR_HOME_FOREGROUND='#71BBEE'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='none'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='#D2977C'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='none'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='#71BBEE'

## STATUS
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_STATUS_OK_BACKGROUND='none'
POWERLEVEL9K_STATUS_ERROR_BACKGROUND='none'
POWERLEVEL9K_OK_ICON=''
POWERLEVEL9K_FAIL_ICON=''

## VCS
POWERLEVEL9K_VCS_GIT_ICON=" "
POWERLEVEL9K_VCS_GIT_GITHUB_ICON=" "
POWERLEVEL9K_VCS_BRANCH_ICON=" "
POWERLEVEL9K_VCS_UNTRACKED_ICON="\u25CF "
POWERLEVEL9K_VCS_UNSTAGED_ICON=" "
POWERLEVEL9K_VCS_STASH_ICON=" " 
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=" "
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=" "
POWERLEVEL9K_VCS_COMMIT_ICON=" "
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='none'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='076'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='none'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='005'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='none'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='003'

## CUSTOM OS ICON
POWERLEVEL9K_CUSTOM_OS_ICON="echo '%F{yellow}$(whoami)%F{217}@%F{203}$(hostname)' "
POWERLEVEL9K_CUSTOM_OS_ICON_BACKGROUND='none'

## ZSH SYNTAX HIGHLIGHTING
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

# Override highlighter colors
ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg="#e66767"
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg='#F7C6BE',standout
ZSH_HIGHLIGHT_STYLES[alias]=fg='#B39FD5'
ZSH_HIGHLIGHT_STYLES[builtin]=fg='#B39FD5'
ZSH_HIGHLIGHT_STYLES[function]=fg='#B39FD5'
ZSH_HIGHLIGHT_STYLES[command]=fg='#B39FD5'
ZSH_HIGHLIGHT_STYLES[precommand]=fg='#B39FD5',underline
ZSH_HIGHLIGHT_STYLES[commandseparator]=fg='#786fa6'
ZSH_HIGHLIGHT_STYLES[hashed-command]=fg='#F7C6BE'
ZSH_HIGHLIGHT_STYLES[path]=fg='#71BBEE',underline
ZSH_HIGHLIGHT_STYLES[globbing]=fg='#786fa6'
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg='#778beb',underline
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg='#F3BE95'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg='#F1CBB5'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='#F7C6BE'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg='#ABDBEF'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg='#ABDBEF'
ZSH_HIGHLIGHT_STYLES[redirection]=fg='#f3a683'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg='#f5cd79'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg='#f5cd79'
ZSH_HIGHLIGHT_STYLES[assign]='#F7C6BE'

## 
alias ls="lsd --group-dirs first --color=auto"
# alias neofetch="neofetch | lolcat -a -s 3000"
alias pacman="pacman --color=auto"
alias yay="yay --color=auto"

PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"
[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh