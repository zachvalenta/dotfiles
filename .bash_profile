echo -n "$(tput setaf 2) updating ~/.bash_profile at$(tput sgr0): "
date

# PROMPT

export PS1="🈚️ ☞☞☞ "
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabaggagx

# NAV - ITERM DEFAULT PANES

alias desk="cd $HOME/Desktop"
alias sw="cd $HOME/Desktop/zvmac/materials/sw"
alias notes="cd $HOME/Desktop/zvmac/notes"
alias site="cd $HOME/Desktop/zvmac/materials/sw/network/4-app-layer/personal-site/zach-valenta/zachvalenta.github.io; open ."

# NAV

alias yin="cd /Volumes/MUSIC-USB; open ."
alias logs="cd $HOME/Desktop/zvmac/notes/jay/logs/2018/09"
alias aihao="cd $HOME/Desktop/zvmac/materials/za/passions; open ."
alias box="cd $HOME/Desktop/zvmac/materials/sw/za/db/scorecard; open ."

# ZA

alias subl="open -a 'Sublime Text'"
alias snip="cd /Users/zach/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Snippets"
alias vsc="open -a 'Visual Studio Code'"
alias tmd="tmux detach-client"
alias zbin="cd $HOME/bin"

# YOUTUBE-DL

alias ytdd="cd $HOME/Desktop/media/ytd; open ."
alias ytd='youtube-dl --extract-audio --audio-format mp3 --audio-quality 0'
alias ytdv='youtube-dl --format mp4'

# GIT

alias gic="printf 'venv\ndb.sqlite3\nnotes.md\nmanage.py\n' > .gitignore"
alias gie="subl .gitignore"
alias gc="subl $HOME/.gitconfig"

# BASH PROFILE

alias bp="subl $HOME/.bash_profile"
alias upbp="source $HOME/.bash_profile"

# DIRECTORY-RELATED

alias d="pwd"
alias cd='function cdl(){ cd "$1"; pwd; l;}; cdl'
alias l='function lsl(){ ls -hl ;}; lsl' # TODO: ternary for args/no-args
alias mkd='function mkd(){ mkdir "$1"; cd "$1";}; mkd'

# UTIL

alias c="clear"
alias rm='function redirect(){ echo "use qing.py instead";}; redirect'
alias t='function treeC(){ tree -C "$1";}; treeC' # TODO: ternary for args/no-args
alias tl='function treeLevel(){ tree -CL $1 $2;}; treeLevel'
alias cppath='pwd | pbcopy'
alias sou='function sou(){ find . -name "$1";}; sou'
PATH="/Users/zach/bin:${PATH}"

# PYTHON

PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}" # Setting PATH for Python 3.6; original version saved in .bash_profile.pysave
export PYTHONDONTWRITEBYTECODE=1
alias py3="python3"

alias py="cd $HOME/Desktop/zvmac/materials/sw/lang/python"
alias ting="cd $HOME/Desktop/zvmac/materials/sw/lang/python/flask"

alias rund="python manage.py runserver"
alias runf="export FLASK_APP=app; export FLASK_ENV=development; flask run"

alias pyt="py3 -m unittest discover -v"

alias venv="py3 -m venv venv; on; pip install -q --upgrade pip setuptools wheel; pip list"
alias on="source venv/bin/activate"
alias off="deactivate"
alias freeze="pip freeze > requirements.txt"
alias heat="pip install -r requirements.txt"

# GO

export GOPATH=$(go env GOPATH) # golang.org/doc.code.html
alias gobin='function gobin(){ $GOPATH/bin/"$1";}; gobin'

# is this a Homebrew thing?

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH