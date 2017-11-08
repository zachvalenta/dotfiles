echo "from zach user profile"

# DEV
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}" # Setting PATH for Python 3.6; original version saved in .bash_profile.pysave
export PATH
alias py3="python3"
alias apache='sudo apachectl'
export GOPATH=$(go env GOPATH) # golang.org/doc.code.html
alias gobin='function gobin(){ $GOPATH/bin/"$1";}; gobin'

# NAV.DEV
alias gop="cd $HOME/go/src"

# NAV.GENERAL
alias home="cd $HOME"
alias desk="cd $HOME/Desktop"
alias kaifa="cd $HOME/Desktop/zvmac/kaifa && ls"

# BASH
alias rm="rm -i"
alias mkd='function mkd(){ mkdir "$1"; cd "$1";}; mkd'
alias cppath='pwd | pbcopy'
alias subl="open -a 'Sublime Text'"

# MUSIC
alias music="cd $HOME/Music/iTunes/iTunes\ Media/Music && open ."
alias gotoytd="cd $HOME/Desktop/zvmac/za/ytd && pwd"
alias ytd='youtube-dl --extract-audio --audio-format mp3 --audio-quality 0'

# PROMPT
export PS1="🈚️ ☞☞☞ "
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
