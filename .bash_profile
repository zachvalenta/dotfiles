###
# 🌇  source
###

echo -n "$(tput setaf 5) updating ~/.bash_profile at$(tput sgr0): "
date

###
# 🌐  globals
###

DOTFILES_DIR="$HOME/Desktop/zvmac/materials/sw/os/za/dotfiles"
MUSIC_DIR="$HOME/Desktop/zvmac/materials/za/passions/music"
export MANPAGER=bat

###
# 🎨  prompt
###

export PS1='`echo "${PWD%/*}" | sed -e "s;\(/.\)[^/]*;\1;g"`/${PWD##*/} \$ '  # https://superuser.com/a/1014107/728972
export CLICOLOR=1
export EXA_COLORS="ga=38;5;213:gm=32:*.py=38;5;114:Dockerfile=38;5;074;1:*.pdf=38;5;208:*.txt=38;5;244:*.html=38;5;137;1"
export LSCOLORS=gxfxcxdxbxegedabaggagx

###
# 📍  tmp
###

alias algos="cd $HOME/Desktop/zvmac/materials/sw/za/algos/algos"
alias crud="cd $HOME/Desktop/zvmac/materials/sw/lang/python/flask/crud"
alias db="cd $HOME/Desktop/zvmac/materials/sw/za/db"
alias dj="cd $HOME/Desktop/zvmac/materials/sw/lang/python/django"
alias sjk="cd $HOME/Desktop/zvmac/materials/sw/za/db/shujuku; rg -A 1 _model_"
alias ml="open $HOME/Desktop/zvmac/materials/sw/za/db/shujuku/music-lib/README.md"
alias skel="cd $HOME/Desktop/zvmac/materials/sw/lang/python/flask/skeleton"


###
# 💾  git
###

# todo - SSoT for core workflow (gb as `git branch`, rm alias in .gitconfig)
# leave less-used cmd (count, far) as .gitconfig aliases

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
alias gl="git l"
alias gc="git c"

###
# 🐍  python
###

PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}" # Setting PATH for Python 3.6; original version saved in .bash_profile.pysave
export PYTHONDONTWRITEBYTECODE=1
export PIP_REQUIRE_VIRTUALENV=true

alias py3="python3"
alias pipx="python3 -m pipx"
alias bpy="bpython"
alias py="cd $HOME/Desktop/zvmac/materials/sw/lang/python"
alias ting="cd $HOME/Desktop/zvmac/materials/sw/lang/python/flask"
alias venv="python3 -m venv venv; on; pip install -q --upgrade pip setuptools wheel; pip list"
alias on="source venv/bin/activate"
alias off="deactivate"
alias pipfr="pip freeze > requirements.txt"
alias pipin="pip install -r requirements.txt"

###
# 🦏  bash
###

function app(){ # rm `rec` and replace with flag
    if [ $# -eq 0 ]; then
        echo "pass a filename"
        return 1
    else
        fname="$1.md";
        ms="$HOME/Desktop/zvmac/materials/sw/za/hiring"
        cp "$ms"/cv/template-app.md "$ms"/throwaway/"$fname"
        vsc "$ms"/throwaway/"$fname"
    fi
}
alias b="bat"
alias bp="vsc $DOTFILES_DIR/.bash_profile"
alias brewup="brew outdated | xargs brew upgrade"
alias brewfr="brew leaves > $DOTFILES_DIR/brew-pkg.txt"
alias c="clear"
alias cd='function cdl(){ cd "$1"; l;}; cdl'
alias cg="cd $HOME/Desktop/zvmac/materials/sw/lang/html-css/personal-site/drafts"
alias cheat="cht.sh --shell"
alias cm="vim +/'## profile' $HOME/Desktop/zvmac/notes/sw//za/hiring.md"
alias cppath='pwd | pbcopy'
alias cpvi="cp $HOME/Desktop/vimium-options.json $DOTFILES_DIR; qing $HOME/Desktop/vimium-options.json"
alias d="pwd"
alias dance="cd $HOME/Desktop/zvmac/materials/za/passions/dance"
alias desk="cd $HOME/Desktop"
alias dot="cd $DOTFILES_DIR"
alias ds="qing .DS_Store"
alias grep="grep --color=auto -n"
alias hc="vim '+normal G$' $HOME/Desktop/zvmac/notes/jay/za/tmp.md"  # http://edunham.net/2015/01/29/vim_open_file_with_cursor_at_the_end.html
alias ind="open $HOME/Desktop/zvmac/materials/sw/lang/html-css/personal-site/zachvalenta.github.io/index.html"
function jbp(){
    jb | grep "$1"
}
function kai(){
    fname="$1.md";
    cwd="$(pwd)";
    touch "$cwd/$fname";
    open "$cwd/$fname";
}
function l(){
    if [ "$1" ]; then
        exa -al --classify --git --git-ignore -I '.git|.DS_Store' "$1" 
    else
        exa -al --classify --git --git-ignore -I '.git|.DS_Store'
    fi
}
alias lj="cd $HOME/Desktop/zvmac/materials/jay/lianjie; open photos"
alias logs="cd $HOME/Desktop/zvmac/notes/jay/logs"
alias m="make"
alias mat="cd $HOME/Desktop/zvmac/materials"
alias mkd='function mkd(){ mkdir "$1"; cd "$1";}; mkd'
alias mp3="cd $HOME/Desktop/zvmac/materials/za; fd -e mp3 -E non-fiction/yuyan/ -E passions/music/ -E passions/dance/"
alias ms="cd $HOME/Desktop/zvmac/materials/sw/za/hiring"
alias gcor="bat $MUSIC_DIR/guitar/chords.md"
alias muz="cd $MUSIC_DIR"
alias notes="cd $HOME/Desktop/zvmac/notes"
alias o="open"
alias oo="open ."
alias pdfg="pdfgrep -in"
alias pg="pgcli"
function rec(){
    if [ $# -eq 0 ]; then
        echo "pass a filename"
        return 1
    else
        fname="$1.md";
        ms="$HOME/Desktop/zvmac/materials/sw/za/hiring/"
        cp "$ms"/cv/template-recruiter.md "$ms"/throwaway/"$fname"
        open "$ms"/throwaway/"$fname"
    fi
}
alias ri="ncal -3"
alias rm='function redirect(){ echo "use qing instead";}; redirect'
alias site="cd $HOME/Desktop/zvmac/materials/sw/lang/html-css/personal-site"
alias snip="cd $HOME/Library/Application\ Support/Code/User/snippets"
alias sw="cd $HOME/Desktop/zvmac/materials/sw"
function t(){
    if [ $# -eq 2 ]; then
        exa -al --tree --level="$1" --git-ignore -I '.git|.DS_Store' "$2"
    elif [ $# -eq 1 ]
    then
        if [[ "$1" =~ ^-?[0-9]+[.,]?[0-9]*$ ]]; then  # break on dir prepended w/ digits e.g. `logs/2019`
            exa -al --tree --level="$1" --git-ignore -I '.git|.DS_Store'
        else
            exa -al --tree --git-ignore -I '.git|.DS_Store' "$1"
        fi
    else
        exa -al --tree --git-ignore -I '.git|.DS_Store'
    fi
}
alias train="open $HOME/Desktop/zvmac/notes/jay/za/training.md; open $HOME/Desktop/zvmac/materials/jay/training"
alias trs="trans :es -I"
alias upbp="source $HOME/.bash_profile"
alias vc="open $HOME/.vimrc"
alias vlc="/Applications/VLC.app/Contents/MacOS/VLC"
alias vsc="open -a 'Visual Studio Code'"
alias vscfr="ls ~/.vscode/extensions/ > $DOTFILES_DIR/vsc-pkg.txt"
alias yin="cd /Volumes/music-usb"
alias ytd='youtube-dl --extract-audio --audio-format m4a'
alias ytdv='youtube-dl --format mp4'
alias yue="cd $HOME/Desktop/zvmac/notes/jay/logs/2020/04"
alias zbin="cd $HOME/bin"
alias zp="vim +/'## leads' $HOME/Desktop/zvmac/notes/sw//za/hiring.md"

###
# 🗑  clean up
###

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# my bin
export PATH="/Users/zach/bin:${PATH}"
# pipx
export PATH="$PATH:/Users/zach/.local/bin"
# go
export PATH=$PATH:$HOME/go/bin
