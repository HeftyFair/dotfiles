
if [[ $(uname) != "Darwin" ]]; then
  return
fi

alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export BOOKS="/Users/andreigavrilov/Library/Mobile Documents/iCloud~QReader~MarginStudy~easy"

export JAVA_HOME=$(/usr/libexec/java_home -v 21)

export PATH='/Users/andreigavrilov/Applications/IntelliJ IDEA Ultimate.app/Contents/MacOS':$PATH
export PATH="$HOME/.config/emacs/bin/":$PATH


[ -f "/Users/andreigavrilov/.ghcup/env" ] && source "/Users/andreigavrilov/.ghcup/env" # ghcup-env
export PATH="/opt/homebrew/opt/grep/libexec/gnubin":$PATH

[[ ! -r /Users/andreigavrilov/.opam/opam-init/init.zsh ]] || source /Users/andreigavrilov/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null


type fzf &> /dev/null && eval "$(fzf --zsh)"



eval "$(fnm env --use-on-cd)"
export PATH=$PATH:'/Applications/Binary Ninja.app/Contents/MacOS'

#. "$HOME/.rye/env"


# export PATH="/opt/homebrew/opt/binutils/bin:$PATH"
#
# function theme_func_kitty()
# {
#   if [[ $THEME == "Light" ]]; then
#     kitty +kitten themes --reload-in=all 'Doom One Light'
#   elif [[ $THEME == "Dark" ]]; then
#     kitty +kitten themes --reload-in=all 'One Half Dark'
#   fi
# }


# typeset -g theme_functions
#theme_functions=($theme_functions theme_func_kitty)


# export PATH="/opt/homebrew/opt/curl/bin":$PATH

export PATH="/Users/andreigavrilov/source/flutter/flutter/bin":$PATH


function use_package() {
  export PACKAGE_DIR="$HOME/source/package/"
  export PATH="$PACKAGE_DIR/bin":$PATH
  export LIBRARY_PATH="$PACKAGE_DIR/lib"
  export LD_RUN_PATH="$PACKAGE_DIR/lib"
  export CPATH="$PACKAGE_DIR/include"
  export CMAKE_PREFIX_PATH="$PACKAGE_DIR/lib/cmake/"
}

export PATH="/Applications/IDA Professional 9.1.app/Contents/MacOS":$PATH
export PATH="/Applications/010 Editor.app/Contents/CmdLine":$PATH
export PATH="/Applications/Wireshark.app/Contents/MacOS":$PATH



export ANDROID_HOME=/Users/andreigavrilov/Library/Android/sdk
export ANDROID_SDK_ROOT=/Users/andreigavrilov/Library/Android/sdk
export ANDROID_NDK="/Users/andreigavrilov/Library/Android/sdk/ndk/27.1.12297006"

function use_android() {
  export PATH="$ANDROID_NDK/toolchains/llvm/prebuilt/darwin-x86_64/bin":$PATH
  export PATH="$HOME/Library/Android/sdk/platform-tools/":$PATH
  export PATH="$ANDROID_SDK_ROOT/build-tools/35.0.0":$PATH
  export PATH="$PATH":"/Users/andreigavrilov/source/research/android/apk.sh/"
}

# . /opt/homebrew/opt/asdf/libexec/asdf.sh

export GPG_TTY=$(tty)
# export GPG_TTY

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
export MAMBA_EXE='/opt/homebrew/Caskroom/miniforge/base/bin/mamba';
export MAMBA_ROOT_PREFIX='/opt/homebrew/Caskroom/miniforge/base';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias mamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<



alias yoink="open -a Yoink"


export FPATH="$FPATH":/nix/var/nix/profiles/default/share/zsh/site-functions
export PATH="$PATH":"$HOME/source/bin/"

function update() {
  _update_all
  brew upgrade
  pushd "/Users/andreigavrilov/Library/Rime" && git pull && popd
}

function cleanup() {
  brew cleanup
  nix store gc
  go clean -modcache
  uv cache clean
}

function use_llvm() {
  export PATH="/opt/homebrew/opt/llvm/bin":"$PATH"
}

function use_depot() {
  export PATH="/Users/andreigavrilov/source/chromium/depot_tools/":"$PATH"
}


function enter_pwn() {
  # . <(nix print-dev-env $HOME/source/practice/ctf/env/re/ | awk '!/LINENO\s*=\s*/')
  nix develop $HOME/source/ctf/env/pwn/ --command zsh
}


function enter_re() {
  # . <(nix print-dev-env $HOME/source/practice/ctf/env/re/ | awk '!/LINENO\s*=\s*/')
  nix develop $HOME/source/ctf/env/re/ --command zsh
}

alias ida-servver-linux='ssh -L 23946:127.0.0.1:23946  -t myhost "cd /home/kwqcheii/source/bin; ./linux_server"'
alias ida-server-win='ssh -L 23946:127.0.0.1:23946 -t win "cd C:\Users\kwqcheii\source\bin; .\win64_remote.exe"'
alias jeb='bash /Users/andreigavrilov/source/tools/jeb/jeb_macos.sh'
alias jnitrace='/Users/andreigavrilov/source/research/android/frida/jnitrace/bin/jnitrace'


# export IDASDKDIR="/Users/andreigavrilov/source/backups/kopia/idapro90rc1/misc/idasdk90"


alias keka="/Applications/Keka.app/Contents/MacOS/Keka --cli"
alias git-pull-all='gfind . -maxdepth 1 -type d -execdir git -C {} pull \;'


# alias preview="qlmanage -p"
alias preview="open -a Preview"
alias marginnote="cd '/Users/andreigavrilov/Library/Mobile Documents/iCloud~QReader~MarginStudy~easy/Documents/'"

export PATH="$PATH:/Applications/Hopper Disassembler v4.app/Contents/MacOS/"
