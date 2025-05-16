# source zsh aliases
source $HOME/.config/zsh/zsh_aliases

# History in cache directory:
HISTFILE=$HOME/.config/zsh/zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.

# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
# Turn off all beeps
unsetopt BEEP

# Export envvars
export EDITOR='/usr/bin/nvim' # Editor
export VISUAL='/usr/bin/nvim' # Visual editor
export PATH="$HOME/.local/bin:$PATH" # For user binaries
export PAGER="most" # color manpages
export VIRTUAL_ENV_DISABLE_PROMPT=tr # For starship prompt 

# Keybindings
bindkey ^R history-incremental-search-backward 
bindkey ^S history-incremental-search-forward
bindkey '^ ' autosuggest-accept # bind strg+space to accept

eval "$(starship init zsh)"
eval "$(direnv hook zsh)"
eval "$(zoxide init --cmd cd zsh)"

fpath+=~/.zfunc
autoload -Uz compinit && compinit

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"
