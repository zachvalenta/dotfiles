echo -n "$(tput setaf 5) updating ~/.bash_profile at$(tput sgr0): "
date

###
# PROMPT
###

export PS1="$ "
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabaggagx

###
# NAV - PRIMARY
###

alias desk="cd $HOME/Desktop"
alias logs="cd $HOME/Desktop/zvmac/notes/jay/logs/2019/02"
alias notes="cd $HOME/Desktop/zvmac/notes"
alias sw="cd $HOME/Desktop/zvmac/materials/sw"
alias yin="cd /Volumes/MUSIC-USB; open ."

###
# NAV - SECONDARY
###

alias box="cd $HOME/Desktop/zvmac/materials/sw/za/za/db; open ."
alias grok="/Users/zach/Desktop/zvmac/materials/sw/za/cs/algos/grokking/grokking-algos"
alias site="cd $HOME/Desktop/zvmac/materials/sw/network/4-app-layer/personal-site/zach-valenta/zachvalenta.github.io; open ."
alias snip="cd /Users/zach/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Snippets"
alias snipvsc="cd $HOME/Library/Application\ Support/Code/User/snippets"
alias zbin="cd $HOME/bin"
alias zbinr="open $HOME/bin/README.md"

###
# NAV - PROJECTS
###

# 📈  grokking algos
alias grok="cd $HOME/Desktop/zvmac/materials/sw/za/cs/algos/grokking/grokking-algos"

# 📈  create Python/Flask app
alias cpa="cd $HOME/Desktop/zvmac/materials/sw/lang/python/create-python-app"
alias cpar="cpa; open README.md"
alias cfa="cd $HOME/Desktop/zvmac/materials/sw/lang/python/create-flask-app"
alias cfar="cfa; open README.md"

# 📈  nginx-wsgi
alias ngf="cd $HOME/Desktop/zvmac/materials/sw/za/services/nginx-wsgi"

# 📈  DDG
alias ms="cd $HOME/Desktop/zvmac/materials/sw/za/industry/applications/linode; open linode.md"

# 📈  book db
alias ting="cd $HOME/Desktop/zvmac/materials/sw/lang/python/flask/book-db"
alias tingr="open $HOME/Desktop/zvmac/materials/sw/lang/python/flask/book-db/README.md"

###
# ZA
###

alias subl="open -a 'Sublime Text'"
alias vsc="open -a 'Visual Studio Code'"
alias tmd="tmux detach-client"
alias m="make"
alias brewup="brew outdated | xargs brew upgrade"
alias tqphl="ansiweather -l 4560349"
alias tqldn="ansiweather -l 2643743"

###
# A/V
###

alias ytdd="cd $HOME/Desktop/media/ytd; open ."
alias ytd='youtube-dl --extract-audio --audio-format mp3 --audio-quality 0'
alias ytdv='youtube-dl --format mp4'
alias vlc="/Applications/VLC.app/Contents/MacOS/VLC"

###
# GIT
###

alias gb="git b"
alias gs="git s"
alias gd="git d"
alias gds="git ds"
alias gl="git l"
alias ga="git a"
alias gai="git ai"
alias gu="git u"
alias gc="git c"
alias gic="touch .gitignore; gie"
alias gie="open .gitignore"
alias gco="open $HOME/.gitconfig"

###
# DOTFILES
###

DOTFILES_DIR="$HOME/Desktop/zvmac/materials/jay/assets-digital/dotfiles"
VSCODE_DIR="$HOME/Library/Application\ Support/Code/User/"

alias dot="cd $DOTFILES_DIR"
alias bp="open $HOME/.bash_profile"
alias upbp="source $HOME/.bash_profile"
alias cpbp="cp $HOME/.bash_profile $DOTFILES_DIR"
alias cpvsc="cp $VSCODE_DIR/*.json $DOTFILES_DIR"
alias rsvsc="cp $DOTFILES_DIR/settings.json $VSCODE_DIR; cp $DOTFILES_DIR/keybindings.json $VSCODE_DIR"
alias cpgc="cp $HOME/.gitconfig $DOTFILES_DIR"
alias cpvi="cp $HOME/Desktop/vimium-options.json $DOTFILES_DIR; qing $HOME/Desktop/vimium-options.json"
# alias cpngt="cp /usr/local/etc/nginx/nginx.conf $DOTFILES_DIR"
# alias cpngf="cp $DOTFILES_DIR/nginx.conf /usr/local/etc/nginx"

###
# DIRECTORY-RELATED
###

alias d="pwd"
alias cd='function cdl(){ cd "$1"; pwd; l;}; cdl'
alias l='function lsl(){ ls -hl ;}; lsl' # TODO: ternary for args/no-args
alias mkd='function mkd(){ mkdir "$1"; cd "$1";}; mkd'

###
# UTIL
###

alias c="clear"
alias cppath='pwd | pbcopy'
alias ff='function ff(){ open -a Firefox $1 ;}; ff'
alias grep="grep --color=auto"
alias t='function treeC(){ tree -C "$1";}; treeC' # TODO: ternary for args/no-args
alias tl='function treeLevel(){ tree -CL $1 $2;}; treeLevel'
alias rm='function redirect(){ echo "use qing instead";}; redirect'
alias sou='function sou(){ find . -name "$1.md";}; sou'
PATH="/Users/zach/bin:${PATH}"

###
# PYTHON - GENERAL
###

PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}" # Setting PATH for Python 3.6; original version saved in .bash_profile.pysave
export PYTHONDONTWRITEBYTECODE=1
alias py3="python3"
alias bpy="bpython"
alias py="cd $HOME/Desktop/zvmac/materials/sw/lang/python"
alias pyt="py3 -m unittest discover -v"
alias rund="on; python manage.py runserver"

###
# PYTHON - FLASK
###

alias cfenv="unset FLASK_APP"
alias fenv="env | grep FLASK"
alias runf="on; export FLASK_APP=app; export FLASK_ENV=development; flask run"
alias sfenv="export FLASK_APP=app"

###
# PYTHON - ENV
###

alias venv="py3 -m venv venv; on; pip install -q --upgrade pip setuptools wheel; pip list"
alias on="source venv/bin/activate"
alias off="deactivate"
alias pipfr="pip freeze > requirements.txt"
alias pipin="pip install -r requirements.txt"

###
# CLEAN UP
###

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
