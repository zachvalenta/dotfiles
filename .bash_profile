###
# 🌇  source
###

echo -n "$(tput setaf 5) updating ~/.bash_profile at$(tput sgr0): "
date

###
# 🌐  globals
###

DOTFILES_DIR="$HOME/Desktop/zvmac/materials/sw/os/za/dotfiles"
export MANPAGER=bat
export RIPGREP_CONFIG_PATH="$DOTFILES_DIR/.ripgreprc"

###
# 🎨  prompt
###

export PS1='`echo "${PWD%/*}" | sed -e "s;\(/.\)[^/]*;\1;g"`/${PWD##*/} \$ '  # https://superuser.com/a/1014107/728972
export CLICOLOR=1
export EXA_COLORS="ga=38;5;213:gm=32:*.py=38;5;114:Dockerfile=38;5;074;1:docker-compose.yml=38;5;074;1:*.pdf=38;5;208:*.txt=38;5;244:*.html=38;5;137;1:*.env*=31;0;01"
export LSCOLORS=gxfxcxdxbxegedabaggagx

###
# 🎹 music
###

alias div="imgcat $HOME/Desktop/zvmac/materials/za/passions/music/theory/note-divisions.jpg"
alias key="cd $HOME/Desktop/zvmac/materials/za/passions/music/theory; imgcat 30-keys.jpg; imgcat circle-of-fifths.png"
alias ml="open $HOME/Desktop/zvmac/materials/sw/za/db/shujuku/music-lib/README.md"
alias muz="cd $HOME/Desktop/zvmac/materials/za/passions/music; t 2"
alias yin="cd /Volumes/music-usb"

###
# 📡 media
###

alias pods="cd $HOME/Desktop/pods"
alias podp="cd $HOME/Desktop/pods/one-off; kaiff"
alias mp3="cd $HOME/Desktop/zvmac/materials/za; fd -e mp3 -E non-fiction/yuyan/ -E passions/music/ -E passions/dance/"
alias ytd='youtube-dl --extract-audio --audio-format m4a'
alias ytdv='youtube-dl --format mp4'

###
# 🚢 docker
###

alias mt="docker"
function mtl(){  # list all
    echo -e "\n";

    echo "🚢 containers";
    printf %"$COLUMNS"s | tr " " "-"
    echo -e "\n";
    docker ps -a;
    echo -e "\n";

    echo "💾 images";
    printf %"$COLUMNS"s | tr " " "-"
    echo -e "\n";
    docker images;
    echo -e "\n";

    echo "🗄  volumes";
    printf %"$COLUMNS"s | tr " " "-"
    echo -e "\n";
    docker volume ls;
    echo -e "\n";
}
# stop containers, rm (stopped containers, unused volumes, dangling images), rm unused images
alias mtp="docker ps -qa | xargs docker stop; docker system prune --volumes -f; docker image prune -af; mtl"
alias mtpc="docker ps -qa | xargs docker stop; docker system prune --volumes -f"

###
# 💾  git
###

# todo - SSoT for core workflow (gb as `git branch`, rm alias in .gitconfig)
# leave less-used cmd (count, far) as .gitconfig aliases

alias gco="open $DOTFILES_DIR/.gitconfig"
alias gic="touch .gitignore; gie"
alias gie="open .gitignore"
alias gb="git b"  # current branch
alias gs="git s"  # status
alias gd="git d"  # diff working directory and repo
alias gds="git ds"  # diff staging area and repo
alias gai="git ai"  # interactive stage
function ga(){  # add specific file(s) or add all (sans args)
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
alias gl="git l"  # prettified log of previous 10 commits
alias glb="git cherry -v master '$(git rev-parse --abbrev-ref HEAD)'"  # log commits on current branch *not* on master
alias gc="git c"  # commit

###
# 🐍  python
###

PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}" # Setting PATH for Python 3.6; original version saved in .bash_profile.pysave
export PYTHONDONTWRITEBYTECODE=1
export PIP_REQUIRE_VIRTUALENV=true

alias py3="python3"
alias tre="/usr/local/Cellar/python/3.7.5/Frameworks/Python.framework/Versions/3.7/bin/python3"
alias bpy="bpython"
alias venv="python3 -m venv venv; on; pip install -q --upgrade pip setuptools wheel; pip list"
alias on="source venv/bin/activate"
alias off="deactivate"

###
# 🛠 tools
###

# packages and extensions
alias brewfr="brew leaves > $DOTFILES_DIR/pkg-brew.txt"
alias brewup="brew outdated | xargs brew upgrade"
alias cpvi="cp $HOME/Desktop/vimium-options.json $DOTFILES_DIR; qing $HOME/Desktop/vimium-options.json"
alias vscfr="ls ~/.vscode/extensions/ > $DOTFILES_DIR/pkg-vsc.txt"
alias pipx="python3 -m pipx"
alias pipxfr="pipx list > $DOTFILES_DIR/python/pkg-pipx.txt"

# exa ports of ls and tree
function l(){
    if [ "$1" ]; then
        exa -al --classify --git --git-ignore -I '.git|.DS_Store' "$1" 
    else
        exa -al --classify --git --git-ignore -I '.git|.DS_Store'
    fi
}
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

# hiring
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

# misc
function jbp(){
    jb | grep "$1"
}
function kai(){
    fname="$1.md";
    cwd="$(pwd)";
    touch "$cwd/$fname";
    open "$cwd/$fname";
}
alias b="bat"
alias c="clear"
alias cd='function cdl(){ cd "$1"; l;}; cdl'
alias cheat="cht.sh --shell"
alias cppath='pwd | pbcopy'
alias d="pwd"
alias ds="qing .DS_Store"
alias grep="grep --color=auto -n"
alias m="make"
alias mkd='function mkd(){ mkdir "$1"; cd "$1";}; mkd'
alias o="open"
alias oo="open ."
alias pdfg="pdfgrep -in"
alias pg="pgcli"
alias ri="ncal -3"
alias rm='function redirect(){ echo "use qing instead";}; redirect'
alias trs="trans :es -I"
alias upbp="source $HOME/.bash_profile"
alias vlc="/Applications/VLC.app/Contents/MacOS/VLC"
alias vsc="open -a 'Visual Studio Code'"

###
# 🛣 navigate
###

# open specific files
alias bp="vsc $DOTFILES_DIR/.bash_profile"
alias cm="vim +/'## profile' $HOME/Desktop/zvmac/notes/sw//za/hiring.md"
alias duan="vim +/'# SHORTS' $HOME/Desktop/zvmac/notes/za/non-fiction/business/rough-cut.md"
alias inc="vim +/'__incremental reading__' $HOME/Desktop/zvmac/notes/za/non-fiction/za/cogsci.md"
alias ind="open $HOME/Desktop/zvmac/materials/sw/lang/html-css/personal-site/zachvalenta.github.io/index.html"
alias hc="vim '+normal G$' $HOME/Desktop/zvmac/notes/jay/za/tmp.md"  # http://edunham.net/2015/01/29/vim_open_file_with_cursor_at_the_end.html
alias train="open $HOME/Desktop/zvmac/notes/jay/za/training.md; open $HOME/Desktop/zvmac/materials/jay/training"
alias vc="open $HOME/.vimrc"
alias zp="vim +/'## leads' $HOME/Desktop/zvmac/notes/sw//za/hiring.md"

# goto - code
alias algos="cd $HOME/Desktop/zvmac/materials/sw/za/algos/algos"
alias db="cd $HOME/Desktop/zvmac/materials/sw/za/db"
alias dot="cd $DOTFILES_DIR"
alias fl="cd $HOME/Desktop/zvmac/materials/sw/lang/python/flask"
alias flenv="cd $HOME/Desktop/zvmac/materials/sw/lang/python/flask/docker-flask-envs-secrets"
alias dj="cd $HOME/Desktop/zvmac/materials/sw/lang/python/django"
alias goc="cd $HOME/go"
alias gop="cd $HOME/Desktop/zvmac/materials/sw/lang/future/golang"
alias ms="cd $HOME/Desktop/zvmac/materials/sw/za/hiring"
alias py="cd $HOME/Desktop/zvmac/materials/sw/lang/python"
alias sw="cd $HOME/Desktop/zvmac/materials/sw"
alias sjk="cd $HOME/Desktop/zvmac/materials/sw/za/db/shujuku; rg _model_"
alias zbin="cd $HOME/bin"

# goto - general
alias dance="cd $HOME/Desktop/zvmac/materials/za/passions/dance; t 3"
alias cg="cd $HOME/Desktop/zvmac/materials/sw/lang/html-css/personal-site/drafts"
alias desk="cd $HOME/Desktop"
alias jay="cd $HOME/Desktop/zvmac/materials/sw/lang/html-css/music-site"
alias lj="cd $HOME/Desktop/zvmac/materials/jay/lianjie; open photos"
alias logs="cd $HOME/Desktop/zvmac/notes/jay/logs"
alias mat="cd $HOME/Desktop/zvmac/materials"
alias nf="cd ~/Desktop/zvmac/notes/za/non-fiction; t"
alias notes="cd $HOME/Desktop/zvmac/notes"
alias snip="cd $HOME/Library/Application\ Support/Code/User/snippets"
alias track="cd $HOME/Desktop/zvmac/materials/sw/za/db/shujuku/tracking"
alias viz="cd $HOME/Desktop/zvmac/materials/za/passions/viz"
alias yue="cd $HOME/Desktop/zvmac/notes/jay/logs/2020/07"
alias zach="cd $HOME/Desktop/zvmac/materials/sw/lang/html-css/personal-site"

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
