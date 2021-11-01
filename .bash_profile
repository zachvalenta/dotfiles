###
# 🌇  SOURCE
###
echo -n "$(tput setaf 5) updating ~/.bash_profile at$(tput sgr0): "
date

###
# 🌐  GLOBALS
###
CODE_DIR="$HOME/Desktop/zvmac/materials/sw"
DOTFILES_DIR="$HOME/Desktop/zvmac/materials/sw/os/za/dotfiles"
LOGS_DIR="$HOME/Desktop/zvmac/notes/jay/logs"
MAT_DIR="$HOME/Desktop/zvmac/materials"
NOTES_DIR="$HOME/Desktop/zvmac/notes"
export MANPAGER=bat
export RIPGREP_CONFIG_PATH="$DOTFILES_DIR/.ripgreprc"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function* --> Homebrew thing?
export PATH="/Users/zach/bin:${PATH}"  # my bin
export PATH="$PATH:/Users/zach/.local/bin"  # pipx
export PATH=$PATH:$HOME/go/bin  # golang
source /Users/zach/Library/Preferences/org.dystroy.broot/launcher/bash/br  # broot
[ -f ~/.fzf.bash ] && source ~/.fzf.bash  # fzf for bash history

###
# 🎨  OUTPUT
###
export CLICOLOR=1
export EXA_COLORS="ga=38;5;213:gm=32:*.py=38;5;114:Dockerfile=38;5;074;1:docker-compose.*=38;5;074;1:*.pdf=38;5;208:*.txt=38;5;244:*.html=38;5;137;1:*.env*=31;0;01:*.sql*=38;5;28"
export LSCOLORS=gxfxcxdxbxegedabaggagx
function _update_ps1() {
    PS1=$(powerline-shell $?)
}
if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

###
# 🏔 FOCUS
###

# DAILY
alias jz="rg 'FOCUS' $HOME/.bash_profile -A 15"
alias shui="bat $CODE_DIR/lang/html-css/personal-site/content/about/quotes.md"
alias cm="vim +/'## profile' $HOME/Desktop/zvmac/notes/sw/za/industry.md"
alias year="bat $LOGS_DIR/21/2021-year.md"
alias day="bat $NOTES_DIR/jay/za/day.md"
alias track="cd $CODE_DIR/db/shujuku/tracking; make bed y=21"

# WEEKLY
alias tq="bat $HOME/Desktop/zvmac/notes/jay/za/reminders.md"
function tw(){
    rg "$1" $HOME/Desktop/zvmac/notes/jay/logs/rn.md | awk 'NF>1{print $NF}' | awk '{s+=$0}END{print s}'
}

# MUSIC
function mq(){
    echo -e "\n";
    rg -A 3 '## current' $NOTES_DIR/za/music/theory.md
    echo -e "\n";
    rg -A 10 '## current' $NOTES_DIR/za/music/guitar.md
    echo -e "\n";
    rg -A 16 '## current' $NOTES_DIR/za/music/instruments.md
    echo -e "\n";
    # s (case-sensitive) U (multiline-mode, necessary for regex)
    rg -sUA 10 'music\n' $DOTFILES_DIR/.bash_profile
}

###
# 🚢 DOCKER
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
# 💾  GIT
###
# todo - SSoT for core workflow (gb as `git branch`, rm alias in .gitconfig), leave less-used cmd (count, far) as .gitconfig aliases
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
alias gshow="git log --format=%B -n 1"  # msg description for commit

###
# 🐍  PYTHON
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
# 🛠 UTILS
###

# pkg
alias brewfr="brew ls --versions > $DOTFILES_DIR/pkg-brew.txt"
alias brewup="brew outdated | xargs brew upgrade"
alias cpvi="cp $HOME/Desktop/vimium-options.json $DOTFILES_DIR; qing $HOME/Desktop/vimium-options.json"
alias vscfr="ls ~/.vscode/extensions/ > $DOTFILES_DIR/vs-code/pkg-vsc.txt"
alias pipx="python3 -m pipx"
alias pipxfr="pipx list > $DOTFILES_DIR/python/pkg-pipx.txt"

# exa ports of ls and tree
alias lh="l | head"
function l(){
    if [ "$1" ]; then
        exa -al --classify --git --git-ignore -I '.git|.DS_Store' "$1" 
    else
        exa -al --classify --git --git-ignore -I '.git|.DS_Store'
    fi
}
function t(){
    # document control flow
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

# za
function kai(){
    fname="$1.md";
    cwd="$(pwd)";
    touch "$cwd/$fname";
    open "$cwd/$fname";
}
alias b="bat"
alias c="clear"
alias cd='function cdl(){ cd "$1"; l;}; cdl'
alias cppath='pwd | pbcopy'
alias d="pwd"
alias ds="qing .DS_Store"
alias grep="grep --color=auto -n"
alias m="make"
alias mkd='function mkd(){ mkdir "$1"; cd "$1";}; mkd'
alias o="open"
alias oo="open ."
alias pdfg="pdfgrep -in"
alias ri="ncal -3"
alias rm='function redirect(){ echo "use qing instead";}; redirect'
alias sym="fd . '/Users/zach' -t l -d 3 -H -E .rvm -E Library -E Movies"  # list all sym links
alias upbp="source $HOME/.bash_profile"
alias vlc="/Applications/VLC.app/Contents/MacOS/VLC"
alias vsc="open -a 'Visual Studio Code'"
alias ytd="youtube-dl -i --extract-audio --audio-format m4a"
alias ytdv="youtube-dl --format mp4"

###
# 🛣 NAVIGATION
###

# read/open
alias bp="vsc $DOTFILES_DIR/.bash_profile"
alias ind="open $CODE_DIR/lang/html-css/personal-site/zachvalenta.github.io/index.html"
alias sou="bat $NOTES_DIR/jay/za/sou.md"
alias train="open $HOME/Desktop/zvmac/notes/jay/za/training.md; open $HOME/Desktop/zvmac/materials/jay/training"
alias vc="open $HOME/.vimrc"
alias zp="vim +/'## leads' $HOME/Desktop/zvmac/notes/sw/za/industry.md"  # http://edunham.net/2015/01/29/vim_open_file_with_cursor_at_the_end.html

# code
alias db="cd $CODE_DIR/db"
alias sand="cd $CODE_DIR/db/query-sandbox"
alias sjk="cd $CODE_DIR/db/shujuku; rg _model_"
alias jobs="cd $CODE_DIR/db/shujuku/jobs"
alias algos="cd $CODE_DIR/algos/algos"
alias dot="cd $DOTFILES_DIR"
alias fl="cd $CODE_DIR/lang/python/flask"
alias dj="cd $CODE_DIR/lang/python/django"
alias knr="cd $CODE_DIR/lang/future/c"
alias me="cd $HOME"
alias ms="cd $CODE_DIR/hiring"
alias py="cd $CODE_DIR/lang/python"
alias shu="cd $CODE_DIR/db/shujuku/bookcase"
alias sw="cd $CODE_DIR; t 2"
alias zbin="cd $HOME/bin"

# music
alias bian="cd $NOTES_DIR/za; rg '## interchange' -A 19 -B 1; rg '## changes' -A 17 -B 1"
alias hx="cd $NOTES_DIR/za; rg '## chords' -A 37 -B 1"
alias key="imgcat $MAT_DIR/za/music/theory/30-keys.jpg; imgcat $MAT_DIR/za/music/theory/circle-of-fifths.png"
alias ml="cd $MAT_DIR/za/music/za/music-library; vim README.md"
alias mode="cd $NOTES_DIR/za; rg '## modes' -A 14 -B 1"
alias muz="cd $MAT_DIR/za/music; t 2"
alias rhy="imgcat $MAT_DIR/za/music/theory/note-divisions.jpg; echo -e '\n'; rg '## rhythm' -A 20 -B 1 $NOTES_DIR; echo -e '\n'"
alias us="rg 'upper structures' -A 33 -B 1 $NOTES_DIR/za"
alias yin="cd /Volumes/music-usb"

# za
alias dance="cd $MAT_DIR/za/dance"
alias desk="cd $HOME/Desktop"
alias frank="open $MAT_DIR/sw/lang/html-css/personal-site/content/notes/2011-fukuyama-political-order.md"
alias film="cd $CODE_DIR/db/shujuku/bookcase/notes/film; vim film.md"
alias jay="cd $CODE_DIR/lang/html-css/music-site"
alias lj="cd $MAT_DIR/jay/lianjie"
alias logs="cd $LOGS_DIR"
alias mat="cd $MAT_DIR"
alias mp3="cd $MAT_DIR/za; fd -e mp3 -e m4a -e mpga -E yuyan/ -E music/ -E dance/ -E pods/"
alias notes="cd $NOTES_DIR; exa -al --tree --git-ignore -I '.git|.DS_Store|jay'; jb"
alias skate="cd /Users/zach/Desktop/zvmac/materials/za/skating; t"
alias snip="cd $HOME/Library/Application\ Support/Code/User/snippets"
alias viz="cd $MAT_DIR/za/viz"
alias yy="cd $MAT_DIR/za/yuyan/spanish; open ibarra-modern-grammar.pdf"
alias trs="trans -I"
alias yue="cd $LOGS_DIR/21/08"
alias zach="cd $CODE_DIR/lang/html-css/personal-site"
