source ~/.config/zsh/pre-config.zsh

autoload -U compinit && compinit
source ~/.local/lib/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/posix-shell-startup.sh
add-zsh-hook precmd paint_ps1
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/.config/zsh/post-config.zsh
