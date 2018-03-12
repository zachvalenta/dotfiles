echo "from zach user profile"

# PROMPT

export PS1="🈚️ ☞☞☞ "
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabaggagx

# NAV

alias sw="cd $HOME/Desktop/zvmac/materials/sw"
alias notes="cd $HOME/Desktop/zvmac/notes"
alias desk="cd $HOME/Desktop"
alias site="subl $HOME/Desktop/zvmac/materials/sw/lang/js/zv_site/tmp/notes.md"

# APP-SPECIFIC 

alias subl="open -a 'Sublime Text'"
alias vsc="open -a 'Visual Studio Code'"
alias tmd="tmux detach-client"

alias gotoytd="cd $HOME/Desktop/zvmac/materials/jay/za/ytd"
alias ytd='youtube-dl --extract-audio --audio-format mp3 --audio-quality 0'
alias ytdv='youtube-dl'

# PROFILES

alias bp="subl $HOME/.bash_profile"
alias upbp="source $HOME/.bash_profile"
alias gc="subl $HOME/.gitconfig"

# BASH

alias cppath='pwd | pbcopy'
alias rm="rm -i"
alias c="clear"
alias cd='function cdl(){ cd "$1"; pwd; ls -l;}; cdl'
alias l='function lsl(){ ls -l;}; lsl'
alias t='function treeC(){ tree -C "$1";}; treeC'
alias mkd='function mkd(){ mkdir "$1"; cd "$1";}; mkd'

# DEV

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}" # Setting PATH for Python 3.6; original version saved in .bash_profile.pysave
export PATH
alias py3="python3"

export GOPATH=$(go env GOPATH) # golang.org/doc.code.html
alias gobin='function gobin(){ $GOPATH/bin/"$1";}; gobin'
