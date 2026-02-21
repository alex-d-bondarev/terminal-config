# Installed:
# brew install bat fd fzf zoxide zsh-autosuggestions zsh-syntax-highlighting


## Customisation
autoload -U colors && colors

# Basic auto/tab complete:
# Credit: https://gist.github.com/LukeSmithxyz/e62f26e55ea8b0ed41a65912fbebbe52
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# bat
export BAT_THEME="GitHub"
alias bathelp='bat --plain --language=help'
help() {
    "$@" --help 2>&1 | bathelp
}

# History
HISTFILE=~/.config/zsh/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY


## Aliases & functions
# First git clone https://github.com/zsh-users/zsh-syntax-highlighting.git, next source this:
source "$HOME/Documents/projects/github/zsh-syntax-highlighting//zsh-syntax-highlighting.zsh"
source "$HOME/.config/aliases/git_lib.zsh"
source "$HOME/.config/aliases/git.zsh"
source "$HOME/.config/aliases/mix.zsh"


## Loads
export GPG_TTY=$(tty)

source <(fzf --zsh)

# Requires any https://www.nerdfonts.com/font-downloads
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

eval "$(zoxide init zsh)"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
