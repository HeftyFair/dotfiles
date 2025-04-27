
# export CMAKE_GENERATOR='Ninja'
# export CMAKE_COLOR_DIAGNOSTICS=ON
export CMAKE_EXPORT_COMPILE_COMMANDS=ON
# export CMAKE_LINKER_TYPE=MOLD

export EDITOR='nvim'
export VISUAL='nvim'

setopt rc_quotes
# setopt hist_ignore_all_dups
# setopt hist_save_no_dups
# setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_fcntl_lock
# Enable history options
setopt appendhistory         # Append history to the history file
setopt sharehistory          # Share history across sessions
setopt hist_ignore_space     # Ignore commands that start with a space
setopt hist_ignore_all_dups  # Ignore duplicate entries in history
setopt hist_save_no_dups     # Do not save duplicate entries in history
setopt hist_ignore_dups      # Ignore consecutive duplicates
setopt hist_find_no_dups     # Do not display duplicates during history search

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=100000
export SAVEHIST=100000

# if [[ "$TERM" == "xterm-kitty" ]]; then
#   if kitty @ run ls &> /dev/null; then
#   # if kitty @ run defaults read -g AppleInterfaceStyle 2&>/dev/null; then
#     export THEME=dark
#   else
#     export THEME=light
#   fi
# fi

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"
# export BAT_THEME="Monokai Extended Light"
#
#

# function set_theme() {
#   zmodload zsh/zpty
#   zpty cur_theme cur_theme
#   zpty -w cur_theme theme
#   export THEME=$(theme)
# }

# set_theme

# in your .bashrc/.zshrc/*rc


# function theme_func_kitty()
# {
#   if [[ $THEME == "Light" ]]; then
#     kitty +kitten themes --reload-in=all 'Doom One Light'
#   elif [[ $THEME == "Dark" ]]; then
#     kitty +kitten themes --reload-in=all 'One Half Dark'
#   fi
# }

# function _set_theme ()
# {
if theme_light; then
  export BAT_THEME="Monokai Extended Light"
  export LS_COLORS="$(vivid generate ayu)"
  export LS_COLORS_THEME=ayu
else
  # (type vivid &> /dev/null) && export LS_COLORS="$(vivid generate catppuccin-frappe)"
  (type vivid &> /dev/null) && export LS_COLORS="$(vivid generate tokyonight-storm)"
  export LS_COLORS_THEME=tokyonight-storm
fi
# }

# typeset -g theme_functions
# theme_functions=($theme_functions theme_func_bat)
#
# function _set_theme() {
#   if [[ -v THEME ]] && [[ -v theme_functions ]]; then
#     for func in "${theme_functions[@]}"; do
#       $func
#     done
#   fi
# }



# function theme_light() {
#   export THEME=Light
#   [[ -v KITTY_WINDOW_ID ]] && kitty +kitten themes --reload-in=all 'Doom One Light'
#   echo "export THEME=Light" > ~/.zsh/theme.zsh
#   _set_theme
# }
# #
# function theme_dark() {
#   export THEME=Dark
#   kitty +kitten themes --reload-in=all 'One Half Dark'
#   echo "export THEME=Dark" > ~/.zsh/theme.zsh
#   _set_theme
# }

# _set_theme

function cminit() {
  mkdir src
  cat <<- 'EOF' > CMakeLists.txt
cmake_minimum_required(VERSION 3.20)
project(proj)
add_executable(proj src/main.cpp)
EOF
  
  cat <<- 'EOF' > .gitignore
out/
.cache/
compile_commands.json
EOF
  
  cat <<- 'EOF' > src/main.cpp
int main() {
  return 0;
}
EOF
}


[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"


export OPENAI_API_BASE=https://api.uniapi.io/v1
export OPENAI_BASE_URL=https://api.uniapi.io/v1


export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export REPO_URL='https://mirrors.tuna.tsinghua.edu.cn/git/git-repo'


function _update_all() {
  antidote update
  pipx upgrade-all
  nvim --headless '+Lazy! sync' +qa
  pushd "$HOME/.config/nvim" && git pull && popd
  rustup upgrade
  dotfiles pull
  uv tool upgrade --all
}
