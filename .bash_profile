echo -n "$(tput setaf 2) updating ~/.bash_profile at$(tput sgr0): "
date

# PROMPT

export PS1="🈚️ ☞☞☞ "
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabaggagx

# NAV - PRIMARY

alias desk="cd $HOME/Desktop"
alias yin="cd /Volumes/MUSIC-USB; open ."
alias sw="cd $HOME/Desktop/zvmac/materials/sw"
alias notes="cd $HOME/Desktop/zvmac/notes"
alias logs="cd $HOME/Desktop/zvmac/notes/jay/logs/2018/11"

# NAV - PROJECTS

alias grok="open $HOME/Desktop/zvmac/materials/sw/za/algos/grokking-algos.pdf"
alias algos="cd $HOME/Desktop/zvmac/materials/sw/za/algos/impl"
alias site="cd $HOME/Desktop/zvmac/materials/sw/network/4-app-layer/personal-site/zach-valenta/zachvalenta.github.io; open ."
alias box="cd $HOME/Desktop/zvmac/materials/sw/za/db/scorecard; open ."

# ZA

alias subl="open -a 'Sublime Text'"
alias snip="cd /Users/zach/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Snippets"
alias vsc="open -a 'Visual Studio Code'"
alias tmd="tmux detach-client"
alias zbin="cd $HOME/bin"
alias m="make"

# YOUTUBE-DL

alias ytdd="cd $HOME/Desktop/media/ytd; open ."
alias ytd='youtube-dl --extract-audio --audio-format mp3 --audio-quality 0'
alias ytdv='youtube-dl --format mp4'

# GIT

alias gs="git s"
alias gd="git d"
alias gc="subl $HOME/.gitconfig"
alias gic="printf 'venv\ndb.sqlite3\nnotes.md\nmanage.py\n' > .gitignore"
alias gie="subl .gitignore"

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
alias rm='function redirect(){ echo "use qing instead";}; redirect'
alias t='function treeC(){ tree -C "$1";}; treeC' # TODO: ternary for args/no-args
alias tl='function treeLevel(){ tree -CL $1 $2;}; treeLevel'
alias cppath='pwd | pbcopy'
alias sou='function sou(){ find . -name "$1.md";}; sou'
alias ff='function ff(){ open -a Firefox $1 ;}; ff'
PATH="/Users/zach/bin:${PATH}"

# PYTHON - GENERAL

PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}" # Setting PATH for Python 3.6; original version saved in .bash_profile.pysave
export PYTHONDONTWRITEBYTECODE=1
alias py3="python3"
alias py="cd $HOME/Desktop/zvmac/materials/sw/lang/python"
alias pyt="py3 -m unittest discover -v"
alias rund="on; python manage.py runserver"

# PYTHON - FLASK

alias runf="on; export FLASK_APP=app; export FLASK_ENV=development; flask run"
alias ting="cd $HOME/Desktop/zvmac/materials/sw/lang/python/flask/ps_course"
alias fenv="env | grep FLASK"
alias sfenv="export FLASK_APP=app"
alias cfenv="unset FLASK_APP"

# PYTHON - ENV

alias venv="py3 -m venv venv; on; pip install -q --upgrade pip setuptools wheel; pip list"
alias on="source venv/bin/activate"
alias off="deactivate"
alias freeze="pip freeze > requirements.txt"
alias heat="pip install -r requirements.txt"

# CLEAN UP

export GOPATH=$(go env GOPATH) # golang.org/doc.code.html
alias gobin='function gobin(){ $GOPATH/bin/"$1";}; gobin'

function npm {
	LOCAL_NPM="./node_modules/.bin/npm"
	if [ -x $LOCAL_NPM ]; then
		$LOCAL_NPM $*
	else
		`which npm` $*
	fi
}
export PATH="./node_modules/.bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH
