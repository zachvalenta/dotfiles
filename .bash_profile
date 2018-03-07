echo "from zach user profile"

# PROMPT
export PS1="🈚️ ☞☞☞ "
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# NAV.MATERIALS
alias mat="cd $HOME/Desktop/zvmac/materials && open ."
alias jay="cd $HOME/Desktop/zvmac/materials/jay"
alias sw="cd $HOME/Desktop/zvmac/materials/sw"
alias za="cd $HOME/Desktop/zvmac/materials/za"

# NAV.NOTES
alias note="cd $HOME/Desktop/zvmac/notes"
alias jayn="cd $HOME/Desktop/zvmac/notes/jay"
alias swn="cd $HOME/Desktop/zvmac/notes/sw"
alias zan="cd $HOME/Desktop/zvmac/notes/za"

# NAV.MISC
alias desk="cd $HOME/Desktop"
alias gop="cd $HOME/go/src"
alias pypro="cd $HOME/Desktop/zvmac/materials/sw/lang/Python"
alias site="cd $HOME/Desktop/zvmac/materials/sw/lang/JS/zv_site"

# APP-SPECIFIC 
alias subl="open -a 'Sublime Text'"
alias vsc="open -a 'Visual Studio Code'"
alias tmd="tmux detach-client"
alias gotoytd="cd $HOME/Desktop/zvmac/materials/jay/za/ytd"
alias ytd='youtube-dl --extract-audio --audio-format mp3 --audio-quality 0'
alias ytdv='youtube-dl'

# BASH
alias bp="subl $HOME/.bash_profile"
alias upbp="source $HOME/.bash_profile"
alias rm="rm -i"
alias c="clear"
alias mkd='function mkd(){ mkdir "$1"; cd "$1";}; mkd'
alias cd='function cdl(){ cd "$1"; pwd; ls -l;}; cdl'
alias cppath='pwd | pbcopy'

# DEV
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}" # Setting PATH for Python 3.6; original version saved in .bash_profile.pysave
export PATH
alias py3="python3"
alias apache='sudo apachectl'
export GOPATH=$(go env GOPATH) # golang.org/doc.code.html
alias gobin='function gobin(){ $GOPATH/bin/"$1";}; gobin'
