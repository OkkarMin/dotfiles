#### Theme
# TokyoNight Color Palette
set -l foreground c8d3f5
set -l selection 2d3f76
set -l comment 636da6
set -l red ff757f
set -l orange ff966c
set -l yellow ffc777
set -l green c3e88d
set -l purple fca7ea
set -l cyan 86e1fc
set -l pink c099ff

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
set -g fish_pager_color_selected_background --background=$selection

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
