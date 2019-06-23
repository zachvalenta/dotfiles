###
# source
###

echo -n "$(tput setaf 5) updating ~/.bash_profile at$(tput sgr0): "
date

###
# prompt
###

export PS1="$ "
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabaggagx

###
# git
###

alias gco="open $HOME/.gitconfig"
alias gic="touch .gitignore; gie"
alias gie="open .gitignore"
alias gb="git b"
alias gs="git s"
alias gd="git d"
alias gai="git ai"
function ga(){
    if [ "$1" ]; then
        git add "$1"
    else
        git add -A
    fi
}
alias gds="git ds"
alias gl="git l"
alias gc="git c"
# alias gu="git u" -> rename closer to `gr`

###
# python
###

PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}" # Setting PATH for Python 3.6; original version saved in .bash_profile.pysave
export PYTHONDONTWRITEBYTECODE=1
export PIP_REQUIRE_VIRTUALENV=true
alias py3="python3"
alias bpy="bpython"
alias py="cd $HOME/Desktop/zvmac/materials/sw/lang/python"
alias ting="cd $HOME/Desktop/zvmac/materials/sw/lang/python/flask"
alias venv="py3 -m venv venv; on; pip install -q --upgrade pip setuptools wheel; pip list"
alias on="source venv/bin/activate"
alias off="deactivate"
alias pipfr="pip freeze > requirements.txt"
alias pipin="pip install -r requirements.txt"

###
# primary
###

alias box="cd $HOME/Desktop/zvmac/materials/sw/za/data/scorecard; open ."
alias cv="open $HOME/Desktop/zvmac/materials/sw/za/industry/hiring/cv/cv.md"
alias desk="cd $HOME/Desktop"
alias lj="cd $HOME/Desktop/zvmac/materials/jay/lianjie; open ."
alias logs="cd $HOME/Desktop/zvmac/notes/jay/logs"
alias mat="cd $HOME/Desktop/zvmac/materials; open ."
alias notes="cd $HOME/Desktop/zvmac/notes"
alias site="cd $HOME/Desktop/zvmac/materials/sw/za/industry/zach-valenta"
alias qt="o $HOME/Desktop/zvmac/materials/sw/za/industry/zach-valenta/blog/quotes.md"
alias sw="cd $HOME/Desktop/zvmac/materials/sw; open ."
alias yin="cd /Volumes/MUSIC-USB"
alias yue="cd $HOME/Desktop/zvmac/notes/jay/logs/2019/06"

###
# projects
###

# 📍 CURRENT READING find . -name "_bookshelf.md" | xargs bat | grep -A 10 '## doing'
alias act="ls -l $HOME/Desktop/zvmac/materials/sw/za/industry/hiring/active"
alias algos="cd $HOME/Desktop/zvmac/materials/sw/za/cs/algos"
alias cpa="cp -r $HOME/Desktop/zvmac/materials/sw/lang/python/create-python-app"  # don't copy .git, venv https://github.com/ashbhat/create-flask-app
alias cpad="cd $HOME/Desktop/zvmac/materials/sw/lang/python/create-python-app"
alias ngf="cd $HOME/Desktop/zvmac/materials/sw/za/services/nginx-wsgi"
alias ms="cd $HOME/Desktop/zvmac/materials/sw/za/industry/hiring"
alias zp="vim +/'# LEADS' $HOME/Desktop/zvmac/notes/sw/za/industry/hiring.md"
alias cm="vim +/'# PROFILE' $HOME/Desktop/zvmac/notes/sw/za/industry/hiring.md"
alias sy="vim +/'# META' $HOME/Desktop/zvmac/notes/sw/za/industry/hiring.md"
alias pypkg="open /Users/zach/Desktop/zvmac/materials/sw/za/industry/zach-valenta/blog/py-pkg.md"
alias sre="cd $HOME/Desktop/zvmac/materials/sw/ops/tf"
alias track="logs; fd tracking -X bat"
alias vimp="open $HOME/Desktop/zvmac/notes/sw/za/editors/vim.md; cd $HOME/Desktop/zvmac/materials/sw/za/editors; open practical-vim.pdf"

###
# editors, terminals, cli
###

alias b="bat"
alias m="make"
alias pdfg="pdfgrep -in"
alias pg="pgcli"
alias sl="litecli"
alias tf="terraform"
alias vsc="open -a 'Visual Studio Code'"

###
# a/v
###

alias ytdd="cd $HOME/Desktop/media/ytd; open ."
alias ytd='youtube-dl --extract-audio --audio-format mp3 --audio-quality 0'
alias ytdv='youtube-dl --format mp4'
alias vlc="/Applications/VLC.app/Contents/MacOS/VLC"
alias yoga-breathe="open $HOME/Desktop/zvmac/materials/jay/training/yoga/breathe.mp4"
alias yoga-wake="open $HOME/Desktop/zvmac/materials/jay/training/yoga/wake.mp4"

###
# dotfiles, conf
###

# 📍 symlinks for these
DOTFILES_DIR="$HOME/Desktop/zvmac/materials/jay/assets-digital/dotfiles"
VSCODE_DIR="$HOME/Library/Application\ Support/Code/User/"

alias dot="cd $DOTFILES_DIR"
alias bp="open $HOME/.bash_profile"
alias upbp="source $HOME/.bash_profile"
alias vscext="ls ~/.vscode/extensions/ > $DOTFILES_DIR/vsc-pkg.txt"
alias cpvsc="cp $VSCODE_DIR/*.json $DOTFILES_DIR"
alias rsvsc="cp $DOTFILES_DIR/settings.json $VSCODE_DIR; cp $DOTFILES_DIR/keybindings.json $VSCODE_DIR"
alias vc="open $HOME/.vimrc"
alias cpvi="cp $HOME/Desktop/vimium-options.json $DOTFILES_DIR; qing $HOME/Desktop/vimium-options.json"
alias brewup="brew outdated | xargs brew upgrade"
alias brewfr="brew leaves > $DOTFILES_DIR/brew-pkg.txt"
alias snip="cd $HOME/Library/Application\ Support/Code/User/snippets"
alias zbin="cd $HOME/bin"
# alias cpngt="cp /usr/local/etc/nginx/nginx.conf $DOTFILES_DIR"
# alias cpngf="cp $DOTFILES_DIR/nginx.conf /usr/local/etc/nginx"

###
# directory-related
###

alias d="pwd"
alias cd='function cdl(){ cd "$1"; pwd; l;}; cdl'
function l(){
    if [ "$1" ]; then
        # echo "$1"
        ls -hl "$1"
    else
        ls -hl .
    fi
}
function ll(){
    if [ "$1" ]; then
        # echo "$1"
        ls -ahl "$1"
    else
        ls -ahl .
    fi
}
alias mkd='function mkd(){ mkdir "$1"; cd "$1";}; mkd'
alias t='function treeC(){ tree -C "$1";}; treeC' # TODO: ternary for args/no-args, if args 1-9 do treeLevel, ignore venv and .DS_Store
alias tl='function treeLevel(){ tree -aCL $1 $2 -I '.git';}; treeLevel'

###
# util
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
alias heat="cd $HOME/Desktop/term; make run"
alias rm='function redirect(){ echo "use qing instead";}; redirect'
alias ri="ncal -3"
PATH="/Users/zach/bin:${PATH}"

###
# clean up
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
