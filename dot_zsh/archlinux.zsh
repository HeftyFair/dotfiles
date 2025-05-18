if [[ $HOST != "archlinux" ]]; then
  return
fi

#
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/kwqcheii/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/kwqcheii/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/kwqcheii/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/kwqcheii/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<



function use_package() {
  export PACKAGE_DIR=/home/kwqcheii/bcache/source/package
  export PATH="$PACKAGE_DIR/bin":$PATH
  export LIBRARY_PATH="$PACKAGE_DIR/lib"
  export LD_RUN_PATH="$PACKAGE_DIR/lib"
  export CPATH="$PACKAGE_DIR/include"
  export CMAKE_PREFIX_PATH="$PACKAGE_DIR/lib/cmake/"
}


function use_depot_tools() {
  export DEPOT_PATH=/home/kwqcheii/source/depot_tools
  export PATH="$DEPOT_PATH":$PATH
}

#export PIN_ROOT="$HOME/source/pintools/pin-3.30-98830-g1d7b601b3-gcc-linux"
export PIN_EXAMPLE="$PIN_ROOT/source/tools/SimpleExamples/"
export PATH=$PATH:$PIN_ROOT

export PATH=$PATH:"/home/kwqcheii/source/applications/android-studio-for-platform-Stable.2.13/bin"

# if not in ssh
if [ -z "$SSH_CONNECTION" ]; then
  # export PATH=$PATH:"$HOME/source/applications/cursor-linux/cursor"
  alias cursor=/home/kwqcheii/Desktop/cursor.AppImage
fi


export PATH=$PATH:"$HOME/ida-pro-9.1/"
