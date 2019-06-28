###
# 🌇  source
###

echo -n "$(tput setaf 5) updating ~/.bash_profile at$(tput sgr0): "
date

###
# 🎨  prompt
###

export PS1="$ "
export CLICOLOR=1
export EXA_COLORS="ga=38;5;213:gm=32:*.py=38;5;114:Dockerfile=38;5;074;1:*.pdf=38;5;208"
export LSCOLORS=gxfxcxdxbxegedabaggagx

###
# 📍  tmp
###

# CURRENT READING find . -name "_bookshelf.md" | xargs bat | grep -A 10 '## doing'
alias cpa="cp -r $HOME/Desktop/zvmac/materials/sw/lang/python/create-python-app"  # don't copy .git, venv https://github.com/ashbhat/create-flask-app
alias pypkg="open /Users/zach/Desktop/zvmac/materials/sw/za/industry/zach-valenta/blog/py-pkg.md"
alias track="logs; fd tracking -X bat"
alias vimp="open $HOME/Desktop/zvmac/notes/sw/za/editors/vim.md; cd $HOME/Desktop/zvmac/materials/sw/za/editors; open practical-vim.pdf"
alias yoga-wake="open $HOME/Desktop/zvmac/materials/jay/training/yoga/wake.mp4"

###
# 💾  git
###

alias gco="open $DOTFILES_DIR/.gitconfig"
alias gic="touch .gitignore; gie"
alias gie="open .gitignore"
alias gb="git b"
alias gs="git s"
alias gd="git d"
alias gai="git ai"
function ga(){
    if [ $# -eq 0 ]; then
        git add -A
        return 0
    else
        for var in "$@"
        do
            git add "$var"
        done
    fi
}
alias gds="git ds"
# todo: gr - control flow - iterate over files to unstage, if `-r` then `git reset --hard HEAD` w/ warning
alias gl="git l"
alias gc="git c"

###
# 🐍  python
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
# 🦏  bash
###

DOTFILES_DIR="$HOME/Desktop/zvmac/materials/jay/assets-digital/dotfiles"

alias algos="cd $HOME/Desktop/zvmac/materials/sw/za/cs/algos"
alias b="bat"
alias box="cd $HOME/Desktop/zvmac/materials/sw/za/data/scorecard; open ."
alias bp="vsc $DOTFILES_DIR/.bash_profile"
alias brewup="brew outdated | xargs brew upgrade"
alias brewfr="brew leaves > $DOTFILES_DIR/brew-pkg.txt"
alias c="clear"
alias cd='function cdl(){ cd "$1"; pwd; l;}; cdl'
alias cm="vim +/'# PROFILE' $HOME/Desktop/zvmac/notes/sw/za/industry/hiring.md"
alias cppath='pwd | pbcopy'
alias cpvi="cp $HOME/Desktop/vimium-options.json $DOTFILES_DIR; qing $HOME/Desktop/vimium-options.json"
alias cv="open $HOME/Desktop/zvmac/materials/sw/za/industry/hiring/cv/cv.md"
alias d="pwd"
alias desk="cd $HOME/Desktop"
alias dot="cd $DOTFILES_DIR"
alias ds="qing .DS_Store"
alias grep="grep --color=auto -n"
function kai(){
    fname="$1.md";
    cwd="$(pwd)";
    touch "$cwd/$fname";
    open "$cwd/$fname";
}
function l(){
    if [ "$1" ]; then
        exa -al --classify --git "$1" --git-ignore -I '.git'
    else
        exa -al --classify --git --git-ignore -I '.git'
    fi
}
# necessary given switch to exa?
function ll(){
    if [ "$1" ]; then
        # echo "$1"
        ls -ahl "$1"
    else
        ls -ahl .
    fi
}
alias lj="cd $HOME/Desktop/zvmac/materials/jay/lianjie; open ."
alias logs="cd $HOME/Desktop/zvmac/notes/jay/logs"
alias m="make"
alias mat="cd $HOME/Desktop/zvmac/materials; open ."
alias mkd='function mkd(){ mkdir "$1"; cd "$1";}; mkd'
alias ms="cd $HOME/Desktop/zvmac/materials/sw/za/industry/hiring"
alias notes="cd $HOME/Desktop/zvmac/notes"
alias o="open"
alias oo="open ."
alias pdfg="pdfgrep -in"
alias pg="pgcli"
alias ri="ncal -3"
alias rm='function redirect(){ echo "use qing instead";}; redirect'
alias site="cd $HOME/Desktop/zvmac/materials/sw/za/industry/zach-valenta"
alias sl="litecli"
alias qt="o $HOME/Desktop/zvmac/materials/sw/za/industry/zach-valenta/blog/quotes.md"
alias snip="cd $HOME/Library/Application\ Support/Code/User/snippets"
alias sw="cd $HOME/Desktop/zvmac/materials/sw; open ."
alias sy="vim +/'# META' $HOME/Desktop/zvmac/notes/sw/za/industry/hiring.md"
function t(){
    if [ "$1" ]; then
        exa -al --tree --level="$1" --git-ignore -I '.git'
    else
        exa -al --tree --git-ignore -I '.git'
    fi
}
alias tf="terraform"
alias upbp="source $HOME/.bash_profile"
alias vc="open $HOME/.vimrc"
alias vlc="/Applications/VLC.app/Contents/MacOS/VLC"
alias vsc="open -a 'Visual Studio Code'"
alias vscfr="ls ~/.vscode/extensions/ > $DOTFILES_DIR/vsc-pkg.txt"
alias yin="cd /Volumes/MUSIC-USB"
alias ytd='youtube-dl --extract-audio --audio-format mp3 --audio-quality 0'
alias ytdd="cd $HOME/Desktop/media/ytd; open ."
alias ytdv='youtube-dl --format mp4'
alias yue="cd $HOME/Desktop/zvmac/notes/jay/logs/2019/06"
alias zbin="cd $HOME/bin"
alias zp="vim +/'# LEADS' $HOME/Desktop/zvmac/notes/sw/za/industry/hiring.md"

###
# 🗑  clean up
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

PATH="/Users/zach/bin:${PATH}"
export PATH
export MANPAGER=bat
