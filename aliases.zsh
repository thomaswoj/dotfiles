# Shortcuts
alias copyed="pbcopy < $HOME/.ssh/id_ed25519.pub"
alias copyrsa="pbcopy < ~/.ssh/id_rsa.pub"
alias reloadshell="source $HOME/.zshrc"
alias l="ls -laF"

# Flush Directory Service cache
alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

# Lock the screen
alias afk="osascript -e 'tell application \"System Events\" to keystroke \"q\" using {command down,control down}'"

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"

# Laravel
alias v="valet"
alias pvp="valet php"
alias vssh='cd ~/homestead_6 && vagrant ssh'
alias vup='cd ~/homestead_6 && vagrant up'
alias art="php artisan"
alias vart="valet php artisan"
alias vc="valet composer"
alias mfs='php artisan migrate:fresh --seed'
alias larastan="vendor/bin/phpstan analyse"

# Huler
alias echomio="cd $VALET/mio.santander && laravel-echo-server start"
alias changelog=""$DOTFILES/scripts/changelog.sh""

# MySQL
# Ref: https://github.com/TablePlus/DBngin/issues/38#issuecomment-731698284
alias mysqls="mysql --socket /tmp/mysql_3306.sock"

# PHP
alias phpunit="vendor/bin/phpunit"
alias c="composer"
alias cu="composer update"
alias cr="composer require"
alias ci="composer install"
alias cda="composer dump-autoload -o"
alias hostfile="sudo nano /etc/hosts"
alias p="phpunit"
alias pp="php artisan test --parallel"
alias pf="phpunit --filter "
alias d="php artisan dusk"
alias sshconfig="nano ~/.ssh/config"
alias sail='./vendor/bin/sail'
alias tunnel='valet share -subdomain=freekmurze -region=eu'

# VSCode
alias code='open -a "/Applications/Visual Studio Code.app" "`pwd`"'

# Git
alias nah='git reset --hard;git clean -df'
alias gc="git checkout"
alias gpo="git push origin"
alias gm="git merge"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

alias awsp="source _awsp"
