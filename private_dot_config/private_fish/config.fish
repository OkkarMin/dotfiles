# UTF and Lang
set -g LANG en_US.UTF-8
set -g LC_ALL en_US.UTF-8
set -g LC_CTYPE en_US.UTF-8

if status is-interactive
    # Commands to run in interactive sessions can go here
    cowsay -b (curl -s -H "Accept: text/plain" https://icanhazdadjoke.com/)
end

# Source starship prompt
starship init fish | source
set fish_key_bindings fish_user_key_bindings

# Source zoxide init
zoxide init fish | source

#### Path to Node ####
fish_add_path /Users/okar/.local/share/nvm/v18.16.0/bin


#### Functions ####
function __check_nvm --on-variable PWD --description 'Do nvm stuff'
    if test -f .nvmrc
        nvm use
    else
        # echo "No .nvmrc file found"
    end
end
__check_nvm

function cdd
    cd $(z -l | awk '{print $2}' | _fzf_wrapper)
end

function e -a profile
    # Exports the AWS_PROFILE environment variable
    export AWS_PROFILE=$profile
end

#### Setting GPG_TTY for GPG code sign ####
set -x GPG_TTY (tty)

#### Exports ####
export K9S_EDITOR=nvim
export EDITOR=nvim
export XDG_CONFIG_HOME="$HOME/.config"

#### Aliases ####
alias v="nvim"
alias vim="nvim"
alias tf="terraform"
alias asl="aws sso login"
alias c="aichat --session --role con"
alias k="kubectl"
alias ca="chezmoi apply"

##Exa Aliases##
alias ls="exa --icons --group-directories-first"
alias ll="exa -l --icons --group-directories-first"
alias la="exa -al --icons --group-directories-first"
alias tree="exa -T --icons"

##Git Aliases##
alias lg="lazygit"
alias ga="git add ."
alias gp="git pull"
alias gpu="git push"
alias gb="git branch"
alias gco="git checkout"
alias gcm="git commit -m"
alias gs="git status"
alias gfap="git fetch --all --prune"
