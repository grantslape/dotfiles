# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=/Users/grantslape/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"
# Update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
 HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(brew bundler common-aliases docker docker-compose git macos zsh-completions zsh-autosuggestions zsh-syntax-highlighting)

# User configuration

export PATH="/Users/$USER/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="/opt/homebrew/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"
source $ZSH/oh-my-zsh.sh

# Other extras
source ~/.scripts.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ "$SSH_CONNECTION" ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='code'
# fi
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias ohmyzsh="mate ~/.oh-my-zsh"

# I hate grep
alias grep="rg --max-columns 1000 --max-columns-preview"

# Maven
export PATH=/opt/apache-maven-3.6.0/bin:$PATH

# GPG
export GPG_TTY=$(tty)

# Some path shimming
# export PATH="/usr/local/sbin:$PATH"
# export PATH="/Users/$USER/bin:$PATH"

# Go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
export GOROOT="/opt/homebrew/Cellar/go/1.18/libexec"
export GOPRIVATE="gitlab.com/u4hq"

# Rust
export PATH=$PATH:$HOME/.cargo/bin

# AWS
export AWS_ASSUME_ROLE_TTL=1h

alias dcu="docker-compose up --build"

alias crawl="ssh -C -i ~/.ssh/cao_key -l joshua crawl.akrasiac.org"

# Path for Z
. /opt/homebrew/etc/profile.d/z.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# added by travis gem
[ -f /Users/grantslape/.travis/travis.sh ] && source /Users/grantslape/.travis/travis.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# sig-utils
export PATH="${PATH}:/Users/$USER/code/sig-utils/utils"

# Lotus
export PATH="${PATH}:/Users/$USER/code/lotus"

# CS testing
export PATH="${PATH}:/usr/local/MacGPG2/bin"

# start gpg properly w/ ssh support
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# Alias common commands so you're always verifying 
# history before accessing production
alias ansible-playbook="sig-ansible-playbook"
alias terraform="sig-terraform"
alias make="sig-make"
alias git="sig-git"

alias todo="todo.sh"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/grantslape/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/grantslape/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/grantslape/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/grantslape/google-cloud-sdk/completion.zsh.inc'; fi
