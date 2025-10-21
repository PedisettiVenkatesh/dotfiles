# --- Powerlevel10k Instant Prompt (keep at the very top for performance) ---
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- Zinit Setup ---
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname "$ZINIT_HOME")"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# --- Powerlevel10k Theme ---
zinit ice depth=1; zinit light romkatv/powerlevel10k
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# --- Plugins ---
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
# zinit light marlonrichert/zsh-autocomplete
# zinit light junegunn/fzf
zinit light Aloxaf/fzf-tab
# zinit light joshskidmore/zsh-fzf-history-search
zinit light MichaelAquilina/zsh-you-should-use

# --- Oh-My-Zsh snippets ---
zinit ice wait"0" silent; zinit snippet OMZP::git
zinit ice wait"0" silent; zinit snippet OMZP::sudo
zinit ice wait"0" silent; zinit snippet OMZP::command-not-found
zinit ice wait"0" silent; zinit snippet OMZP::history
zinit ice wait"0" silent; zinit snippet OMZP::docker

autoload -U compinit && compinit

zinit cdreplay -q


# --- History Configuration ---
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory sharehistory 
setopt hist_ignore_space hist_ignore_all_dups hist_save_no_dups hist_ignore_dups hist_find_no_dups

# --- Locale ---
export LANG=en_US.UTF-8

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'


# --- zsh-autocomplete Customization ---
# zstyle ':autocomplete:*' min-input 1
# zstyle ':autocomplete:*' default-context history-incremental-search-backward

# Character for the suggestion list's selected item (default: ❯)
# zstyle ':autocomplete:list-choices' selected-prefix '▶ '

# Style for the current highlighted suggestion (reverse video + bold)
# zstyle ':autocomplete:highlight' fg=white bg=blue bold

# Style for other items in the suggestion list
# zstyle ':autocomplete:list-choices' fg=black bg=white

# Use lighter background for the preview box
# zstyle ':autocomplete:preview-window' bg=gray fg=black

# Show inline help and cursor indicator
# zstyle ':autocomplete:cursor' block

# --- fzf-tab Configuration ---
# zstyle ':completion:*' menu select
# zstyle ':completion:*:descriptions' format '[%d]'
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*' fzf-preview 'bat --style=numbers --color=always $realpath'
# zstyle ':completion:*:*:*:*:files' command fzf-file-preview

# fzf-file-preview() {
#   local file="$1"
#   [[ -f "$file" ]] && bat --style=numbers --color=always "$file" || head -n 20 "$file"
# }

# --- Fuzzy Search History (Ctrl+R) ---
# fzf-history-widget() {
#   local selected=$(fc -rl 1 | awk '{$1=""; print substr($0,2)}' | \
#     fzf --height 40% --reverse --inline-info --prompt="History ➜ " --no-sort)
#   if [[ -n "$selected" ]]; then
#     LBUFFER="$selected"
#     zle redisplay
#   fi
# }
# zle -N fzf-history-widget
# bindkey '^R' fzf-history-widget

# --- Key Bindings ---
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down
# bindkey "${terminfo[kcuu1]}" history-substring-search-up
# bindkey "${terminfo[kcud1]}" history-substring-search-down

# --- Aliases ---
alias ls='ls --color'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
# alias c='clear'
alias c='printf "\033[H\033[2J"'
alias x='exit'
alias s='source'
alias sz='source ~/.zshrc'
alias sv='source ~/.vimrc'
alias sb='source ~/.bashrc'
alias sn='source ~/.nanorc'
alias st='source ~/.tmux.conf'
alias sg='source ~/.gitconfig'

alias vb='v ~/.bashrc'
alias vz="v ~/.zshrc"
alias vo="v ~/.oh-my-zsh"
alias vv='v ~/.vimrc'

alias tmux='tmux -u'
alias t='tmux -u'
alias ta='t a'
alias tat='t a -t'

alias bat='batcat'
alias v='vi'
# alias o='codium .'
alias e='xdg-open .'

o() {
  if [ "$#" -eq 0 ]; then
    codium .
  else
    codium "$@"
  fi
}
  
alias dstart='echo "sudo systemctl start docker" && sudo systemctl start docker'
alias dstatus='echo "sudo systemctl status docker" && sudo systemctl status docker'
alias dstop='echo "sudo systemctl stop docker" && sudo systemctl stop docker'

alias python='python3'
alias py='python3'
alias pip='pip3'
alias pips='pipenv shell'

# --- --- ---
# source <(fzf --zsh)
# eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

# --- Node Version Manager (NVM) ---
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

# --- pipx path ---
export PATH="$PATH:$HOME/.local/bin"

# export PATH="$PATH:$HOME/Android/cmdline-tools/latest/bin"
# export ANDROID_HOME="$HOME/Android/Sdk"
# export ANDROID_SDK_ROOT="$HOME/vyktr/Android/Sdk"
# export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH"


#function preexec() {
#  printf "\033[H\033[2J"
#}


