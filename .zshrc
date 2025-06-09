# --- Powerlevel10k Instant Prompt (keep at the very top for performance) ---
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- Zinit Setup ---
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Install Zinit if missing
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname "$ZINIT_HOME")"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# --- Powerlevel10k Theme ---
zinit ice depth=1
zinit light romkatv/powerlevel10k

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# --- Plugins ---
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit ice wait"0" atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light jeffreytse/zsh-vi-mode
zinit light junegunn/fzf
zinit light marlonrichert/zsh-autocomplete

# --- Oh-My-Zsh snippets ---
zinit ice wait"0"
zinit snippet https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/git/git.plugin.zsh
zinit snippet https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh
zinit snippet https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/docker/docker.plugin.zsh
zinit snippet https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/history/history.plugin.zsh

# --- Cursor Settings ---
ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BEAM
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK
ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_BLINKING_UNDERLINE

# --- Completion ---
autoload -Uz compinit
compinit

# --- History Configuration ---
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY INC_APPEND_HISTORY HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS SHARE_HISTORY

# --- Locale ---
export LANG=en_US.UTF-8

# --- zsh-autocomplete Customization ---
zstyle ':autocomplete:*' min-input 1
zstyle ':autocomplete:*' default-context history-incremental-search-backward

# --- fzf-tab Configuration ---
zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' fzf-preview 'bat --style=numbers --color=always $realpath'
zstyle ':completion:*:*:*:*:files' command fzf-file-preview

fzf-file-preview() {
  local file="$1"
  [[ -f "$file" ]] && bat --style=numbers --color=always "$file" || head -n 20 "$file"
}

# --- Fuzzy Search History (Ctrl+R) ---
fzf-history-widget() {
  local selected=$(fc -rl 1 | awk '{$1=""; print substr($0,2)}' | \
    fzf --height 40% --reverse --inline-info --prompt="History ➜ " --no-sort)
  if [[ -n "$selected" ]]; then
    LBUFFER="$selected"
    zle redisplay
  fi
}
zle -N fzf-history-widget
bindkey '^R' fzf-history-widget

# --- History Arrows (↑ ↓) with Substring Search ---
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey "${terminfo[kcuu1]}" history-substring-search-up
bindkey "${terminfo[kcud1]}" history-substring-search-down

# --- Aliases ---
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias c='clear'
alias x='exit'
alias s='source'
alias su='sudo'
alias sz='source ~/.zshrc'

alias bashconfig='v ~/.bashrc'
alias zshconfig="v ~/.zshrc"
alias ohmyzsh="v ~/.oh-my-zsh"
alias vconfig='v ~/.vimrc'

alias tmux='tmux -u'
alias t='tmux -u'
alias ta='t a'
alias tat='t a -t'

alias bat='batcat'
alias v='nvim'
alias o='code .'
alias e='xdg-open .'

alias d='docker'
alias dstart='echo "sudo systemctl start docker" && sudo systemctl start docker'
alias dstatus='echo "sudo systemctl status docker" && sudo systemctl status docker'
alias dstop='echo "sudo systemctl stop docker" && sudo systemctl stop docker'

alias python='python3'
alias py='python3'
alias pip='pip3'
alias pips='pipenv shell'

# --- Zoxide (Directory Jumper) ---
eval "$(zoxide init zsh)"

# --- Node Version Manager (NVM) ---
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

# --- pipx path ---
export PATH="$PATH:$HOME/.local/bin"
