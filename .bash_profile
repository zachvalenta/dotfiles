echo -n "$(tput setaf 5) updating ~/.bash_profile at$(tput sgr0): "
date

###
# PROMPT
###

export PS1="$ "
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabaggagx

###
# PRIMARY
###

alias box="cd $HOME/Desktop/zvmac/materials/sw/za/data/scorecard; open ."
alias cv="open $HOME/Desktop/zvmac/materials/sw/za/industry/hiring/cv/cv.md"
alias desk="cd $HOME/Desktop"
alias hr="vim $HOME/Desktop/zvmac/notes/sw/za/industry/hiring.md"
alias lj="open $HOME/Desktop/zvmac/materials/jay/lianjie"
alias logs="cd $HOME/Desktop/zvmac/notes/jay/logs"
alias mat="cd $HOME/Desktop/zvmac/materials; open ."
alias notes="cd $HOME/Desktop/zvmac/notes"
alias pas="cd $HOME/Desktop/zvmac/materials/za/passions; open ."
alias site="cd $HOME/Desktop/zvmac/materials/sw/network/4-app-layer/personal-site/zach-valenta/zachvalenta.github.io; open ."
alias sou='function sou(){ find . -name "$1.md";}; sou'
alias yin="cd /Volumes/MUSIC-USB; open ."
alias yue="cd $HOME/Desktop/zvmac/notes/jay/logs/2019/04"
alias zz="ls $HOME/Desktop/zvmac/materials/sw/za/industry/hiring/active"

###
# PROJECTS
###

# 📍 CURRENT READING find . -name "_bookshelf.md" | xargs bat | grep -A 10 '## doing'
alias act="ls -l $HOME/Desktop/zvmac/materials/sw/za/industry/hiring/active"
alias algos="cd $HOME/Desktop/zvmac/materials/sw/za/cs/algos"
alias cpa="cd $HOME/Desktop/zvmac/materials/sw/lang/python/create-python-app"
alias ngf="cd $HOME/Desktop/zvmac/materials/sw/za/services/nginx-wsgi"
alias ms="cd $HOME/Desktop/zvmac/materials/sw/za/industry/hiring"
alias pin="vim $HOME/Desktop/zvmac/materials/sw/za/industry/hiring/active/active.md"
alias pypkg="open $HOME/Desktop/zvmac/materials/sw/network/4-app-layer/personal-site/zach-valenta/blog/py-pkg.md"
alias sre="cd $HOME/Desktop/zvmac/materials/sw/ops/tf"
alias ting="cd $HOME/Desktop/zvmac/materials/sw/lang/python/flask/book-db"
alias vimp="open $HOME/Desktop/zvmac/notes/sw/za/editors/vim.md; cd $HOME/Desktop/zvmac/materials/sw/za/editors; open practical-vim.pdf"

###
# EDITORS, TERMINALS, CLI
###

# lexicographical, cruft
alias subl="open -a 'Sublime Text'"
alias vsc="open -a 'Visual Studio Code'"
alias tmd="tmux detach-client"
alias pg="pgcli"
alias m="make"
alias b="bat"
alias tqphl="ansiweather -l 4560349"
alias tqldn="ansiweather -l 2643743"
alias tf="terraform"
alias pdfg="pdfgrep -in"

###
# A/V
###

alias ytdd="cd $HOME/Desktop/media/ytd; open ."
alias ytd='youtube-dl --extract-audio --audio-format mp3 --audio-quality 0'
alias ytdv='youtube-dl --format mp4'
alias vlc="/Applications/VLC.app/Contents/MacOS/VLC"
alias yoga-breathe="open $HOME/Desktop/zvmac/materials/jay/training/yoga/breathe.mp4"
alias yoga-wake="open $HOME/Desktop/zvmac/materials/jay/training/yoga/wake.mp4"

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
# DOTFILES, CONF
###

# 📍 symlinks for these
DOTFILES_DIR="$HOME/Desktop/zvmac/materials/jay/assets-digital/dotfiles"
VSCODE_DIR="$HOME/Library/Application\ Support/Code/User/"

alias dot="cd $DOTFILES_DIR"
alias bp="open $HOME/.bash_profile"
alias upbp="source $HOME/.bash_profile"
alias cpbp="cp $HOME/.bash_profile $DOTFILES_DIR"
alias cpvsc="cp $VSCODE_DIR/*.json $DOTFILES_DIR"
alias rsvsc="cp $DOTFILES_DIR/settings.json $VSCODE_DIR; cp $DOTFILES_DIR/keybindings.json $VSCODE_DIR"
alias cpgc="cp $HOME/.gitconfig $DOTFILES_DIR"
alias vc="open $HOME/.vimrc"
alias cpvi="cp $HOME/Desktop/vimium-options.json $DOTFILES_DIR; qing $HOME/Desktop/vimium-options.json"
alias brewup="brew outdated | xargs brew upgrade"
alias brewfr="brew leaves > $DOTFILES_DIR/brew-pkg.txt"
alias snip="cd /Users/zach/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Snippets"
alias snipvsc="cd $HOME/Library/Application\ Support/Code/User/snippets"
alias zbin="cd $HOME/bin"
alias cpvsc="ls ~/.vscode/extensions/ > $DOTFILES_DIR/vsc-pkg.txt"
# alias cpngt="cp /usr/local/etc/nginx/nginx.conf $DOTFILES_DIR"
# alias cpngf="cp $DOTFILES_DIR/nginx.conf /usr/local/etc/nginx"

###
# DIRECTORY-RELATED
###

alias d="pwd"
alias cd='function cdl(){ cd "$1"; pwd; l;}; cdl'
alias l='function lsl(){ ls -hl ;}; lsl' # TODO: ternary for args/no-args
alias mkd='function mkd(){ mkdir "$1"; cd "$1";}; mkd'
alias t='function treeC(){ tree -C "$1";}; treeC' # TODO: ternary for args/no-args
alias tl='function treeLevel(){ tree -CL $1 $2;}; treeLevel'

###
# UTIL
###

alias o="open"
alias oo="open ."
function kai(){
    fname="$1.md";
    cwd="$(pwd)";
    touch "$cwd/$fname";
    open "$cwd/$fname";
}
alias c="clear"
alias cppath='pwd | pbcopy'
alias grep="grep --color=auto"
alias rm='function redirect(){ echo "use qing instead";}; redirect'
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

export GOPATH=$(go env GOPATH) # golang.org/doc.code.html --> double check
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
