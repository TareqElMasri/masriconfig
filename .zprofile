source ~/.profile
#!/bin/bash

alias redis=~/redis/src/redis-server
alias photoshop="open /Applications/Adobe\ Photoshop\ CC\ 2017/Adobe\ Photoshop\ CC\ 2017.app"
alias illustrator="open /Applications/Adobe\ Illustrator\ CC\ 2017/Adobe\ Illustrator.app"
alias indesign="open /Applications/Adobe\ InDesign\ CC\ 2017/Adobe\ InDesign\ CC\ 2017.app"
alias elves.serve="/usr/local/Cellar/mysql/5.7.12/bin/mysql.server start --skip-grant-tables && cd ~/workspace/elves/elvesapp-mw && rails s -b 0.0.0.0"
alias chillhound.serve="cd ~/workspace/chillhound/chillhound-pro-api && source venv/bin/activate && python server/run.py"
alias mamp="open /Applications/MAMP\ PRO/MAMP\ PRO.app/"
alias mamp.start="sudo /Applications/MAMP/Library/bin/httpd -f '/Library/Application Support/appsolute/MAMP PRO/conf/httpd.conf' -k start && sh -c '/Applications/MAMP/Library/bin/mysqld_safe --defaults-file=/Applications/MAMP/tmp/mysql/my.cnf --port=3306 --socket=/Applications/MAMP/tmp/mysql/mysql.sock --user=alex --pid-file=/Applications/MAMP/tmp/mysql/mysql.pid --log-error=/Applications/MAMP/logs/mysql_error_log.err --tmpdir=/Applications/MAMP/tmp/mysql/tmpdir --datadir=/Library/Application\ Support/appsolute/MAMP\ PRO/db/mysql &'"
alias mamp.stop="sudo /Applications/MAMP/Library/bin/httpd -f '/Library/Application Support/appsolute/MAMP PRO/conf/httpd.conf' -k stop && sh -c '/Applications/MAMP/Library/bin/mysqladmin -u root -proot --socket=/Applications/MAMP/tmp/mysql/mysql.sock shutdown'"
alias docker.quick="bash '/Applications/Docker/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh'"
alias mongo.start="brew services start mongodb"
alias sails.start="sails lift --dev"
alias php.console="php -a"
alias services="brew services"
alias calc=bc
alias cdd='cd ~/Downloads/'
alias rm='rm -rf'
alias .=cd
alias dus='du -d 1 | sort -n '
alias acki='ack -ai'
alias agi='ag -i'
alias updateclock='sudo ntpdate -u time.apple.com'
alias g='env -u LC_CTYPE grep -i'
alias r='env -u LC_CTYPE grep -ir'
alias G='env -u LC_CTYPE grep'
alias F='env -u LC_CTYPE fgrep'
alias c=cat
alias rmi='rm -i'
alias mvi='mv -i'
alias cpi='cp -i'
alias cpr='rsync --progress -a'
alias lld='ls -ld'
alias ..='cd ..'
alias 644='chmod 644'
alias 755='chmod 755'
alias ox='od -Ax -tx1'
alias dusort='du -d 1 | sort -n'
alias diff='colordiff'
alias less='less -R'
alias .h="cd /Applications/MAMP/htdocs"
alias .w="cd ~/workspace"
alias .wd="cd ~/workspace-design"
alias .wc="cd ~/workspace-downloads"
alias .wr="cd ~/workspace-resources"
alias .ws="cd ~/workspace-sftp"
alias .wt="cd ~/workspace-test"
# alias ls='ls -GlFta'
alias ls='colorls -lA --sd'
alias ll='ls -o'
alias la='ls -lag'
alias edit="code"
alias zrc="edit ~/.zshrc"
alias src="source ~/.zprofile"
alias erc="edit ~/.zprofile"
alias i="yarn install --ignore-scripts"
alias electron="/Applications/Electron.app/Contents/MacOS/Electron"
alias pytvenv="source bin/activate"
alias node.debug="node --trace-deprecation"
alias heroku.log="heroku logs --tail > ../npm-debug.log"
alias heroku.run="heroku ps:scale web=1"
alias heroku.restart="heroku restart"
alias heroku.tail="heroku logs --tail"
alias heroku.bash="heroku run bash"
alias heroku.vim="heroku vim"
alias ssl="sudo certbot certonly --manual"
alias simple="python -m SimpleHTTPServer"
alias serve="gulp serve"
alias rundev="npm run dev"
alias start="npm start"
alias dwnwb="wget -E -H -k -K -p"
alias deepdig="wget -m -p -E -k -K -np"
alias artisan="php artisan"
alias composer="php /usr/local/bin/composer"


## Functions

# ZSH Managment
zinstall() {
    # TODO: Automate this process
    git clone $1 ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/$2
    echo "Success! :) Activate the plugin in ~/.zshrc \n"
    echo "plugins=( [plugins...] $2"
}

# Network
ports () {
 lsof -i ':'$1
}

mcd () {
 mkdir $1 && cd $1
}

cross () {
 tns livesync $1 --emulator --watch
}

rnm () {
 rename -vs $1 $2 *
}

# Source control
alias git.create="git create -d"
alias git.init="git commit -am 'inital commit'"
alias pull="git pull"
alias clone="git clone"
alias branch="git branch"
alias push.origin="git push origin"
alias push.init="git push -u origin master"

function push () {
    git push origin "$(git rev-parse --abbrev-ref HEAD)"
}

function git.sync () {
    git branch --merged >/tmp/merged-branches && \
    vi /tmp/merged-branches && xargs git branch -d </tmp/merged-branches
}

function git.ci () {
 git ci -am $1
}

function git.add () {
 git ci -am "[ADD] $1"
}

function git.edit () {
 git ci -am "[EDIT] $1"
}

function git.fix () {
 git ci -am "[FIX] $1"
}

function git.del () {
 git ci -am "[DEL] $1"
}

function git.merge () {
 git ci -am "[MERGE] $1"
}

count () {
 ls $1 | wc -l
}

size () {
 du -sh $1
}

rand () {
    base64 /dev/urandom | tr -d '/+' | dd bs=$1 count=1 2>/dev/null
}

php.exec () {
    php -r "$1;"
}
php.echo () {
    php -r "echo '$1';"
}

md5hash () {
    php -r "echo md5('$1');"
}

embedsub () {
    ffmpeg -i $1 -i $2 -c:v copy -c:a copy -c:s mov_text -metadata:s:s:0 language=eng out.mp4
}

compressvideo () {
    ffmpeg -i $1 -c:v h264 -an -crf 30 -b:v 256k $2
}

extract () {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f "$1" ] ; then
        NAME=${1%.*}
        #mkdir $NAME && cd $NAME
        case "$1" in
          *.tar.bz2)   tar xvjf ./"$1"    ;;
          *.tar.gz)    tar xvzf ./"$1"    ;;
          *.tar.xz)    tar xvJf ./"$1"    ;;
          *.lzma)      unlzma ./"$1"      ;;
          *.bz2)       bunzip2 ./"$1"     ;;
          *.rar)       unrar x -ad ./"$1" ;;
          *.gz)        gunzip ./"$1"      ;;
          *.tar)       tar xvf ./"$1"     ;;
          *.tbz2)      tar xvjf ./"$1"    ;;
          *.tgz)       tar xvzf ./"$1"    ;;
          *.zip)       unzip ./"$1"       ;;
          *.Z)         uncompress ./"$1"  ;;
          *.7z)        7z x ./"$1"        ;;
          *.xz)        unxz ./"$1"        ;;
          *.exe)       cabextract ./"$1"  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "'$1' - file does not exist"
    fi
fi
}
function export_first_path_if_exists() {
    test -d "$1" && export PATH="$1:$PATH"
}
function export_path_if_exists() {
    test -d "$1" && export PATH="$1:$PATH"
}
function source_if_exists() {
    test -f "$1" && source "$1"
}
function eval_if_exists() {
    test -f $(which $1) && eval "$2"
}


function trash() {
  for item in "$@"; do
    if [[ -e "$item" ]]; then
      item_name="$(basename $item)"
      if [[ -e "${HOME}/.Trash/${item_name}" ]]; then
        mv -f "$item" "${HOME}/.Trash/${item_name} $(date "+%H-%M-%S")"
      else
        mv -f "$item" "${HOME}/.Trash/"
      fi
    fi
  done
}

# https://github.com/mooz/percol
function ppgrep() {
    if [[ $1 == "" ]]; then
        PERCOL=percol
    else
        PERCOL="percol --query $1"
    fi
    ps aux | eval $PERCOL | awk '{ print $2 }'
}

function ppkill() {
    if [[ $1 =~ "^-" ]]; then
        QUERY=""            # options only
    else
        QUERY=$1            # with a query
        [[ $# > 0 ]] && shift
    fi
    ppgrep $QUERY | xargs kill $*
}
function exists { which $1 &> /dev/null }

if exists percol; then
    function percol_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }

    zle -N percol_select_history
    bindkey '^T' percol_select_history
fi
