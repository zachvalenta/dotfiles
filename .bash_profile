echo "from ~/.bash_profile"

# PROMPT

export PS1="🈚️ ☞☞☞ "
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabaggagx

# NAV

alias desk="cd $HOME/Desktop"
alias notes="cd $HOME/Desktop/zvmac/notes"
alias logs="cd $HOME/Desktop/zvmac/notes/jay/logs/2018"
alias goals="cd $HOME/Desktop/zvmac/notes/jay/goals"

alias sw="cd $HOME/Desktop/zvmac/materials/sw"
alias dj="cd $HOME/Desktop/zvmac/materials/sw/lang/python/django"
alias proj="cd $HOME/Desktop/zvmac/materials/sw/_projects"
alias hc="subl $HOME/Desktop/zvmac/materials/sw/_projects/human_chinese/.tmp/notes.md"
alias site="subl $HOME/Desktop/zvmac/materials/sw/_projects/site/.tmp/notes.md"

alias aihao="cd $HOME/Desktop/zvmac/materials/za/passions; open ."

# APP-SPECIFIC 

alias subl="open -a 'Sublime Text'"
alias vsc="open -a 'Visual Studio Code'"
alias tmd="tmux detach-client"

alias gotoytd="cd $HOME/Desktop/zvmac/materials/jay/za/ytd"
alias ytd='youtube-dl --extract-audio --audio-format mp3 --audio-quality 0'
alias ytdv='youtube-dl'

alias gic="printf '_参考\nvenv\ndb.sqlite3\nnotes.md\' > .gitignore"
alias gie="subl .gitignore"

# PROFILES

alias bp="subl $HOME/.bash_profile"
alias upbp="source $HOME/.bash_profile"
alias gc="subl $HOME/.gitconfig"
alias snip="cd /Users/zach/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Snippets"

# BASH

alias d="pwd"
alias cd='function cdl(){ cd "$1"; pwd; l;}; cdl'
alias l='function lsl(){ ls -hl ;}; lsl'
alias mkd='function mkd(){ mkdir "$1"; cd "$1";}; mkd'
alias c="clear"
alias rm="rm -i"
alias t='function treeC(){ tree -C "$1";}; treeC'
alias cppath='pwd | pbcopy'

# PYTHON

PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}" # Setting PATH for Python 3.6; original version saved in .bash_profile.pysave
export PATH
export PYTHONDONTWRITEBYTECODE=1
alias py3="python3"

alias venv="py3 -m venv venv; on"
alias on="source venv/bin/activate"
alias off="deactivate"
alias run="python manage.py runserver"
alias freeze="pip freeze > requirements.txt"
alias warm="pip install -r requirements.txt"

# GO

export GOPATH=$(go env GOPATH) # golang.org/doc.code.html
alias gobin='function gobin(){ $GOPATH/bin/"$1";}; gobin'

# is this a Homebrew thing?

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
