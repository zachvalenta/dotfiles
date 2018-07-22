echo "from ~/.bash_profile"

# PROMPT

export PS1="🈚️ ☞☞☞ "
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabaggagx

# NAV

alias pao="cd $HOME/Desktop/zvmac/materials/sw/network/4-app-layer/personal-site; open .; open 'notes.md'"
alias desk="cd $HOME/Desktop"
alias yin="cd /Volumes/MUSIC-USB"
alias sw="cd $HOME/Desktop/zvmac/materials/sw"
alias notes="cd $HOME/Desktop/zvmac/notes"
alias logs="cd $HOME/Desktop/zvmac/notes/jay/logs/2018/07"
alias goals="cd $HOME/Desktop/zvmac/notes/jay/goals"
alias aihao="cd $HOME/Desktop/zvmac/materials/za/passions; open ."
alias box="open $HOME/Desktop/zvmac/materials/sw/za/db/scorecard"
alias wz="open $HOME/Desktop/zvmac/materials/za/non-fiction/#media"

# APP-SPECIFIC 

alias subl="open -a 'Sublime Text'"
alias snip="cd /Users/zach/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Snippets"

alias vsc="open -a 'Visual Studio Code'"
alias tmd="tmux detach-client"
alias sql="sqlite3"
alias zbin="cd $HOME/bin"

alias ytdd="cd $HOME/Desktop/media/ytd; open ."
alias ytd='youtube-dl --extract-audio --audio-format mp3 --audio-quality 0'
alias ytdv='youtube-dl --format mp4'

alias gic="printf 'venv\ndb.sqlite3\nnotes.md\nnode_modules' > .gitignore"
alias gie="subl .gitignore"
alias gc="subl $HOME/.gitconfig"

# BASH

alias bp="subl $HOME/.bash_profile"
alias upbp="source $HOME/.bash_profile"

alias d="pwd"
alias cd='function cdl(){ cd "$1"; pwd; l;}; cdl'
alias l='function lsl(){ ls -hl ;}; lsl'
alias lsd='function lsd(){ ls -dlt */ .*/ ;}; lsd'
alias mkd='function mkd(){ mkdir "$1"; cd "$1";}; mkd'
alias c="clear"
alias rm="rm -i"
alias t='function treeC(){ tree -C "$1";}; treeC'
alias cppath='pwd | pbcopy'
alias sou='function sou(){ find . -name "$1";}; sou'
PATH="/Users/zach/bin:${PATH}"

# PYTHON

PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}" # Setting PATH for Python 3.6; original version saved in .bash_profile.pysave
export PYTHONDONTWRITEBYTECODE=1
alias py3="python3"

alias venv="py3 -m venv venv; on"
alias on="source venv/bin/activate"
alias off="deactivate"
alias run="python manage.py runserver"
alias freeze="pip freeze > requirements.txt"
alias heat="pip install -r requirements.txt"

# GO

export GOPATH=$(go env GOPATH) # golang.org/doc.code.html
alias gobin='function gobin(){ $GOPATH/bin/"$1";}; gobin'

# is this a Homebrew thing?

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH
