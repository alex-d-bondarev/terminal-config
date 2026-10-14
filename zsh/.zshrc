# Installed:
# brew install bat fd fzf starship zoxide zsh-autosuggestions zsh-syntax-highlighting

# Uncomment to profile zsh performance
# Don't forget to do the same with zprof command at the bottom!
# zmodload zsh/zprof

## Customisation
autoload -U colors && colors

# Basic auto/tab complete setup
# Credit: https://gist.github.com/LukeSmithxyz/e62f26e55ea8b0ed41a65912fbebbe52
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
# -C skips the ~400ms compaudit security scan when .zcompdump is <24h old.
zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
[[ -n "${zcompdump}"(#qNmh-24) ]] && compinit -C -d "$zcompdump" || compinit -d "$zcompdump"
unset zcompdump
_comp_options+=(globdots)		# Include hidden files.

# History
HISTFILE=~/.config/zsh/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY

## Aliases & functions
source "$HOME/.config/lib/git_lib.zsh"
source "$HOME/.config/lib/git.zsh"
source "$HOME/.config/lib/git_custom.zsh"
source "$HOME/.config/lib/mix.zsh"
source "$HOME/.config/lib/cached_init.zsh"

export GPG_TTY=$(tty)

source <(fzf --zsh)

# ###########
# Styling
# ###########

# First git clone https://github.com/zsh-users/zsh-syntax-highlighting.git, next source this:
source "$HOME/Documents/projects/github/zsh-syntax-highlighting//zsh-syntax-highlighting.zsh"

# Requires any https://www.nerdfonts.com/font-downloads
cached_eval starship starship init zsh
export STARSHIP_CONFIG=~/.config/starship.toml

cached_eval zoxide zoxide init zsh

BREW_PREFIX="$(brew --prefix)"
source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# ###########
# Export variables from .env
# ###########
set -o allexport; source ~/.env; set +o allexport

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
cached_eval pyenv pyenv init --no-rehash -

# The bat app
export BAT_THEME="GitHub"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Uncomment to profile zsh performance
# zprof
