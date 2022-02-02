echo -n "$(tput setaf 5) updating ~/.z_profile at$(tput sgr0): "; date

alias zp="vim $HOME/.zprofile"
alias upzp="source $HOME/.zprofile"

alias home="cd $HOME"
alias me="cd $HOME/Documents/"

alias cd='function cdl(){ cd "$1"; pwd; l;}; cdl'
function l(){
    if [ "$1" ]; then
        ls -ahl "$1"
    else
        ls -ahl .
    fi
}
