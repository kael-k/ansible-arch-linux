export PATH="$PATH:/opt/android-sdk/tools/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"
export ANDROID_HOME="/opt/android-sdk"

# fix jetbrains blank windows bug https://github.com/baskerville/bspwm/issues/52#issuecomment-24199556
export _JAVA_AWT_WM_NONREPARENTING=1

alias k=kubectl
alias kctx=kubectx
alias kns=kubens
alias f=fuck
alias c=clear
alias v=vim
alias n=nvim
alias x=ranger
alias sway="dbus-run-session sway"
alias glg="git log --stat --all --graph"

source /usr/share/zsh-antidote/antidote.zsh
antidote load
autoload -Uz promptinit && promptinit && prompt pure
autoload -U compinit && compinit
autoload -U bashcompinit && bashcompinit

eval $(thefuck --alias)
