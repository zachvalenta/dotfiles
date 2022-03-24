###
# 🌇  SOURCE
###
echo -n "$(tput setaf 5) updating ~/.bash_profile at$(tput sgr0): "; date

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
export PATH="$HOME/Desktop/zvmac/materials/sw/os/za/bin:${PATH}"  # my bin
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
export MLR_KEY_COLOR=208
export MLR_VALUE_COLOR=33

###
# 🏔 workflow
###

alias wf="rg 'FOCUS' $HOME/.bash_profile -A 18 -B 5"

# reminders
alias tq="bat $HOME/Desktop/zvmac/notes/jay/za/reminders.md"
alias shui="bat $CODE_DIR/lang/html-css/personal-site/content/about/quotes.md"
alias year="bat $LOGS_DIR/22/2022-year.md"

# kanban
alias cm="vim +/'## profile' $HOME/Desktop/zvmac/notes/sw/za/industry.md"
alias kbd="rg -UA 3 '## current\n\n[\w|\*]' $NOTES_DIR/sw"
alias kbm="rg -UA 3 '## current\n\n[\w|\*]' $NOTES_DIR/za/music"
alias kbr="\cd $NOTES_DIR; rg -UA 3 '## current\n\n[\w|\*]' -g '!sw/*' -g '!za/music/*'"

# kbr
alias zach="cd $CODE_DIR/lang/html-css/personal-site"
alias ind="open $CODE_DIR/lang/html-css/personal-site/zachvalenta.github.io/index.html"
alias vind="vim $CODE_DIR/lang/html-css/personal-site/zachvalenta.github.io/index.html"
alias tuan="cd /Users/zach/Desktop/zvmac/materials/sw/db/shujuku/bookcase/notes/non-fiction/#clusters"

###
# 🎹 MUSIC
###

alias mh="rg -sUA 16 '🎹 MUSIC' $DOTFILES_DIR/.bash_profile"
function changes(){
    rg "## changes" -A 5 -B 1 $NOTES_DIR/za/music/theory.md
    rg "## interchange" -A 5 -B 1 $NOTES_DIR/za/music/theory.md
}
function chords(){
    rg "## chords" -A 37 -B 1 $NOTES_DIR/za/music/theory.md
    rg "## chords" -A 8 -B 1 $NOTES_DIR/za/music/guitar.md
    rg "## chords" -A 12 -B 1 $NOTES_DIR/za/music/instruments.md
}
alias keys="imgcat $MAT_DIR/za/music/theory/30-keys.jpg; imgcat $MAT_DIR/za/music/theory/circle-of-fifths.png"
alias modes="cd $NOTES_DIR/za; rg -U '## modes\n' -A 14 -B 1"
alias rhy="imgcat $MAT_DIR/za/music/theory/note-divisions.jpg; echo -e '\n'; rg '## rhythm' -A 20 -B 1 $NOTES_DIR; echo -e '\n'"
alias muz="cd $MAT_DIR/za/music; t 2"
alias ml="cd $MAT_DIR/za/music/za/music-library; vim README.md"
alias yin="cd /Volumes/music-usb"

###
# 🚢 DOCKER
###

alias mt="docker"
alias docker_stat="docker ps --format 'table {{.Names}}\t{{.State}}\t{{.Status}}'"  #  https://docs.docker.com/engine/reference/commandline/ps/#formatting
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
alias venv2="python3 -m venv venv-$(echo $PWD | awk -F'/' '{print $NF}')"
alias on="source venv/bin/activate"
alias off="deactivate"

###
# 🛠 UTILS
###

# packaging
alias brewfr="brew ls --versions > $DOTFILES_DIR/pkg-brew.txt"
alias brewup="brew outdated | xargs brew upgrade"
alias cpvi="cp $HOME/Desktop/vimium-options.json $DOTFILES_DIR; qing $HOME/Desktop/vimium-options.json"
alias vscfr="ls ~/.vscode/extensions/ > $DOTFILES_DIR/vs-code/pkg-vsc.txt"
alias pipx="python3 -m pipx"
alias pipxfr="pipx list > $DOTFILES_DIR/python/pkg-pipx.txt"

# exa
alias lh="l | head"
function l(){
    if [ "$1" ]; then
        exa -al --classify --git --git-ignore -I '.git|.DS_Store' "$1" 
    else
        exa -al --classify --git --git-ignore -I '.git|.DS_Store'
    fi
}
function ll(){
    if [ "$1" ]; then
        exa --classify --git -I '.git|.DS_Store|.localized' "$1"
    else
        exa --classify --git -I '.git|.DS_Store|.localized'
    fi
}
function t(){
    # t <depth> <dir>
    if [ $# -eq 2 ]; then
        exa -al --tree --level="$1" --git-ignore -I '.git|.DS_Store' "$2"
    # t <depth>
    elif [ $# -eq 1 ]
    then
        # break on dir prepended w/ digits e.g. logs/2019
        if [[ "$1" =~ ^-?[0-9]+[.,]?[0-9]*$ ]]; then  # break on dir prepended w/ digits e.g. `logs/2019`
            exa -al --tree --level="$1" --git-ignore -I '.git|.DS_Store'
        else
            exa -al --tree --git-ignore -I '.git|.DS_Store' "$1"
        fi
    # t
    else
        exa -al --tree --git-ignore -I '.git|.DS_Store'
    fi
}

alias b="bat"
alias cd='function cdl(){ cd "$1"; l;}; cdl'
alias cppath='pwd | pbcopy'
alias d="pwd"
alias v="vimv"
alias c="clear"
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
alias upbp="source $DOTFILES_DIR/.bash_profile"
alias vlc="/Applications/VLC.app/Contents/MacOS/VLC"
alias vsc="open -a 'Visual Studio Code'"
alias ytd="youtube-dl -i --extract-audio --audio-format m4a"
alias ytdv="youtube-dl --format mp4"

function kai(){
    fname="$1.md";
    cwd="$(pwd)";
    touch "$cwd/$fname";
    open "$cwd/$fname";
}
function logf(){
    fname="$1.log";
    cwd="$(pwd)";
    touch "$cwd/$fname";
    open "$cwd/$fname";
}

###
# 🛣 NAVIGATION
###

# dev env
alias denv="cd $DOTFILES_DIR/.."
alias bin="cd $DOTFILES_DIR/../bin"
alias dot="cd $DOTFILES_DIR"
function logf(){
    fname="$1.log";
    cwd="$(pwd)";
    touch "$cwd/$fname";
    open "$cwd/$fname";
}
alias vimp="cd $HOME/.vim/pack; t 3"

# sw - general
alias sw="cd $CODE_DIR"
alias bp="vsc $DOTFILES_DIR/.bash_profile"
alias vc="open $HOME/.vimrc"
alias home="cd $HOME"
alias py="cd $CODE_DIR/lang/python"
alias algos="cd $CODE_DIR/algos/algos"

# sw - data
alias db="cd $CODE_DIR/db"
alias sand="cd $CODE_DIR/db/query-sandbox"
alias sjk="cd $CODE_DIR/db/shujuku; rg _model_"
alias shu="\cd $CODE_DIR/db/shujuku/bookcase; gs; t 2 notes/"
alias jobs="cd $CODE_DIR/db/shujuku/jobs"
alias ms="cd $CODE_DIR/hiring"
alias zp="vim +/'## leads' $HOME/Desktop/zvmac/notes/sw/za/industry.md"  # http://edunham.net/2015/01/29/vim_open_file_with_cursor_at_the_end.html

# za
alias dance="cd $MAT_DIR/za/dance; t 2; t | wc -l"
alias desk="cd $HOME/Desktop"
alias frank="open $MAT_DIR/sw/lang/html-css/personal-site/content/notes/2011-fukuyama-political-order.md"
alias jay="cd $CODE_DIR/lang/html-css/music-site"
alias lj="cd $MAT_DIR/jay/lianjie"
alias logs="cd $LOGS_DIR"
alias mat="cd $MAT_DIR"
alias mp3="cd $MAT_DIR/za; fd -e mp3 -e m4a -e mpga -E yuyan/ -E music/ -E dance/ -E pods/"
alias notes="\cd $NOTES_DIR; jb"
alias skate="cd /Users/zach/Desktop/zvmac/materials/za/skating; t 2"
alias snip="cd $HOME/Library/Application\ Support/Code/User/snippets"
alias sou="rg '## search' $NOTES_DIR/za/business/operations.md -A 19"
alias train="open $HOME/Desktop/zvmac/notes/jay/za/training.md; open $HOME/Desktop/zvmac/materials/jay/training"
alias viz="cd $MAT_DIR/za/viz"
alias yy="cd $MAT_DIR/za/yuyan/spanish; open ibarra-modern-grammar.pdf"
alias trs="trans -I"
alias yue="cd $LOGS_DIR/21/11"
