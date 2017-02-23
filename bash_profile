source ~/.git-prompt.sh
source ~/.aliases
# fzf support ctrl-T, ctrl-R etc..
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
