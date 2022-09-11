###
# 🌇  SOURCE
###
echo -n "$(tput setaf 5) updating ~/.bash_profile at$(tput sgr0): "; date

###
# 🌐  GLOBALS
###

# file system
MAT_DIR="$HOME/Desktop/zvmac/materials"
CODE_DIR="$HOME/Desktop/zvmac/materials/sw"
DOTFILES_DIR="$HOME/Desktop/zvmac/materials/sw/os/za/dotfiles"
NOTES_DIR="$HOME/Desktop/zvmac/notes"
PER_DIR="$HOME/Desktop/zvmac/personal"

# env
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
export MLR_KEY_COLOR=208-underline
export MLR_VALUE_COLOR=33

###
# 🏔 WORKFLOW
###

# CADENCE
alias wf="rg 'WF' $HOME/.bash_profile -A11 -B5"
alias jbb="jb | b"
alias qd="vim $HOME/Desktop/zvmac/personal/calendar/logs/22/22.09.md; gr"
alias shui="bat $CODE_DIR/lang/html-css/content/about/quotes.md"
alias year="bat $HOME/Desktop/zvmac/personal/calendar/logs/yearly/22-year.md"

# ART, HUMANITIES, STEM, LIANJIE
alias kba="rg -UA 3 '## current\n\n[\w|\*]' $NOTES_DIR/art"
alias kbh="rg -UA 3 '## current\n\n[\w|\*]' $NOTES_DIR/humanities"
alias kbs="rg -UA 5 '## current\n\n[\w|\*]' $NOTES_DIR/stem"
function lj(){
    rg -A 5 kata "$NOTES_DIR/art/aesthetics.md"
    rg -UA 4 "## current\n\n[\w|\*]" "$PER_DIR/contacts/lianjie.md"
    rg -UA 3 "## current\n\n[\w|\*]" "$PER_DIR/contacts/qin.md"
}

###
# 🎹 MUSIC
###

alias mh="rg -sUA 20 '🎹 MUSIC' $DOTFILES_DIR/.bash_profile"
function changes(){
    rg "## changes" -A 8 -B 1 $NOTES_DIR/art/music/theory.md
    rg "## interchange" -A 5 -B 1 $NOTES_DIR/art/music/theory.md
    echo -e "\n";
    huan
    echo -e "\n";
}
function chords(){
    rg "## chords" -A 33 -B 1 $NOTES_DIR/art/music/theory.md
    rg "## chords" -A 8 -B 1 $NOTES_DIR/art/music/guitar.md
    rg "## chords" -A 12 -B 1 $NOTES_DIR/art/music/instruments.md
}
alias keys="imgcat $MAT_DIR/art/music/theory/30-keys.jpg; imgcat $MAT_DIR/art/music/theory/circle-of-fifths.png; rg -UA 6 '## key' $NOTES_DIR/art/music/theory.md"
alias modes="rg -U '## modes\n' -A 14 -B 1 $NOTES_DIR/art/music"
alias rhy="imgcat $MAT_DIR/za/music/theory/note-divisions.jpg; echo -e '\n'; rg '## rhythm' -A 20 -B 1 $NOTES_DIR; echo -e '\n'"
alias ml="cd $MAT_DIR/art/music/za/music-library; vim README.md"
alias us='rg -A 19  "upper structures" $NOTES_DIR'
alias yin="cd /Volumes/music-usb"
alias muz="cd $MAT_DIR/art/music"

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
function ga(){  # https://stackoverflow.com/a/27875395
    if [ $# -eq 0 ]; then
        echo -n "are you sure? "
        read answer
        if [ "$answer" != "${answer#[Yy]}" ]; then
            echo "adding all"
            git add -A
        fi
    else
        for var in "$@"
        do
            git add "$var"
            echo "added ${var}"
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

# 3.10
alias diez="/usr/local/Cellar/python\@3.10/3.10.1/Frameworks/Python.framework/Versions/3.10/bin/python3"
alias pipx="diez -m pipx"
alias bpy="diez -m bpython"
# 3.6
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}" # Setting PATH for Python 3.6; original version saved in .bash_profile.pysave
export PYTHONDONTWRITEBYTECODE=1
alias py3="python3"
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

alias home="cd $HOME"
alias desk="cd $HOME/Desktop"
alias root="cd $HOME/Desktop/zvmac; t 2"
alias shu="\cd $HOME/Desktop/zvmac/bookcase; gs; t 2 notes/"
alias mat="cd $MAT_DIR"
alias art="cd $MAT_DIR/art"
alias dev="cd $CODE_DIR"
alias notes="\cd $NOTES_DIR; jb"
alias per="cd $HOME/Desktop/zvmac/personal"
alias gr="cd $HOME/Desktop/zvmac/personal/calendar; gd"

# denv
alias denv="cd $DOTFILES_DIR/.."
alias dot="cd $DOTFILES_DIR"
alias bp="vsc $DOTFILES_DIR/.bash_profile"
alias logs="cd $DOTFILES_DIR/../logs"
alias snip="cd $HOME/Library/Application\ Support/Code/User/snippets"
alias vimp="cd $HOME/.vim/pack; t 3"

# MRU repos
alias algos="cd $CODE_DIR/algos/algos"
alias ms="cd $CODE_DIR/hiring"
alias sand="cd $CODE_DIR/db/query-sandbox"
alias site="cd $CODE_DIR/lang/html-css"
alias sjk="cd $CODE_DIR/db/shujuku; rg _model_"

# za
alias cm="vim +/'## profile' $HOME/Desktop/zvmac/notes/stem/dev/za/industry.md"
alias chess="rg -A 15 '## 参考' $NOTES_DIR/humanities/games/chess.md"
alias golf="cd $MAT_DIR/humanities/golf"
alias sk8="cd $MAT_DIR/art/skating"
alias fy="cd $MAT_DIR/humanities/yuyan/french"
alias zp="vim +/'## leads' $NOTES_DIR/stem/dev/za/industry.md"  # http://edunham.net/2015/01/29/vim_open_file_with_cursor_at_the_end.html
