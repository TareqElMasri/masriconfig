#!/bin/bash

export PATH=$PATH:/data/master/SDK/android-sdk/sdk/tools
export PATH=$PATH:$HOME/.node/bin:$HOME/.npm-packages/bin:~/.rbenv/bin:$HOME/.meteor
export PATH=$PATH:/Applications/Genymotion\ Shell.app/Contents/MacOS/:/Applications/Genymotion.app/Contents/MacOS/
export JAVA_HOME=$(/usr/libexec/java_home)
export ANDROID_HOME=/usr/local/opt/android-sdk
eval "$(rbenv init -)"

alias redis=~/redis/src/redis-server
alias elves.serve="/usr/local/Cellar/mysql/5.7.12/bin/mysql.server start --skip-grant-tables && cd ~/workspace/elves/elvesapp-mw && rails s -b 0.0.0.0"
alias chillhound.serve="cd ~/workspace/chillhound/chillhound-pro-api && source venv/bin/activate && python server/run.py"
alias mamp="open /Applications/MAMP\ PRO/MAMP\ PRO.app/"
alias mamp.start="sudo /Applications/MAMP/Library/bin/httpd -f '/Library/Application Support/appsolute/MAMP PRO/conf/httpd.conf' -k start && sh -c '/Applications/MAMP/Library/bin/mysqld_safe --defaults-file=/Applications/MAMP/tmp/mysql/my.cnf --port=3306 --socket=/Applications/MAMP/tmp/mysql/mysql.sock --user=alex --pid-file=/Applications/MAMP/tmp/mysql/mysql.pid --log-error=/Applications/MAMP/logs/mysql_error_log.err --tmpdir=/Applications/MAMP/tmp/mysql/tmpdir --datadir=/Library/Application\ Support/appsolute/MAMP\ PRO/db/mysql &'"
alias mamp.stop="sudo /Applications/MAMP/Library/bin/httpd -f '/Library/Application Support/appsolute/MAMP PRO/conf/httpd.conf' -k stop && sh -c '/Applications/MAMP/Library/bin/mysqladmin -u root -proot --socket=/Applications/MAMP/tmp/mysql/mysql.sock shutdown'"
alias docker.quick="bash '/Applications/Docker/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh'"
alias mongo.start="brew services start mongodb"
alias sails.start="sails lift --dev"
alias php.console="php -a"
alias calc=bc
alias cdd='cd ~/Downloads/'
alias .h=/Applications/MAMP/htdocs
alias .w=~/workspace
alias zrc="atom ~/.zshrc"
alias erc="atom ~/.zprofile"
alias src="source ~/.zprofile"
alias pull="git pull"
alias push="git push"
alias clone="git clone"
alias push.origin="git push origin"
alias simple="python -m SimpleHTTPServer"
alias serve="gulp serve"
alias start="npm start"
alias dwnwb="wget -E -H -k -K -p"
alias artisan="php artisan"
alias composer="php /usr/local/bin/composer"

mcd () {
 mkdir $1 && cd $1
}

cross () {
 tns livesync $1 --emulator --watch
}

rnm () {
 rename -vs $1 $2 *
}

git.add () {
 git ci -am "[ADD] $1"
}

git.edit () {
 git ci -am "[EDIT] $1"
}

git.fix () {
 git ci -am "[FIX] $1"
}

git.del () {
 git ci -am "[DEL] $1"
}

git.merge () {
 git ci -am "MERGE $1"
}

count () {
 ls $1 | wc -l
}

size () {
 du -sh $1
}

rand () {
    date +%s | base64 | head -c $1 ; echo
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
