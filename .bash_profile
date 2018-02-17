echo "from zach user profile"

# DEV
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}" # Setting PATH for Python 3.6; original version saved in .bash_profile.pysave
export PATH
alias py3="python3"
alias apache='sudo apachectl'
export GOPATH=$(go env GOPATH) # golang.org/doc.code.html
alias gobin='function gobin(){ $GOPATH/bin/"$1";}; gobin'

# NAV.GENERAL

alias home="cd $HOME"
alias desk="cd $HOME/Desktop && ls"

alias me="cd $HOME/Desktop/zvmac/personal && ls"
alias kaifa="cd $HOME/Desktop/zvmac/profession && ls"
alias proj="cd $HOME/Desktop/zvmac/projects && ls"

# NAV.DEV

alias gop="cd $HOME/go/src && pwd && ls"
alias pypro="cd $HOME/Desktop/zvmac/profession/lang/Python && pwd && ls"
alias site="cd $HOME/Desktop/zvmac/profession/lang/JS/zv_site && pwd && ls"

# BASH
alias rm="rm -i"
alias c="clear"
alias mkd='function mkd(){ mkdir "$1"; cd "$1";}; mkd'
alias cdl='function cdl(){ cd "$1"; pwd; ls;}; cdl'
alias cppath='pwd | pbcopy'
alias subl="open -a 'Sublime Text'"
alias vsc="open -a 'Visual Studio Code'"
alias tmd="tmux detach-client"
# find . -maxdepth 2 -type d -ls

# MUSIC
alias music="cd $HOME/Music/iTunes/iTunes\ Media/Music && open ."
alias gotoytd="cd $HOME/Desktop/zvmac/personal/za/ytd && pwd"
alias ytd='youtube-dl --extract-audio --audio-format mp3 --audio-quality 0'
alias ytdv='youtube-dl'

# PROMPT
export PS1="🈚️ ☞☞☞ "
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
