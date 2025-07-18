if [[ $HOST != 'myhost' ]]; then
  return
fi


#export KUBECONFIG="/etc/rancher/k3s/k3s.yaml"

path=(
    "$HOME/.config/emacs/bin"
    $path
)

# >>>> Vagrant command completion (start)
fpath=(/nix/store/dy3gm8llzibzqrk6gfb34yviq8bcr1s4-vagrant-2.4.1/lib/ruby/gems/3.1.0/gems/vagrant-2.4.1/contrib/zsh $fpath)
#compinit
# <<<<  Vagrant command completion (end)
#

#
function use_pin ()
{
    export PIN_ROOT="$HOME/source/pintools/pin-external-3.31-98861-g71afcc22f-gcc-linux"
    export PATH=${PIN_ROOT}:$PATH
    alias trace="${PIN_ROOT}/pin -t ${PIN_ROOT}/source/tools/SimpleExamples/obj-intel64/trace.so -no_compress --"
    alias pintenet="${PIN_ROOT}/pin -t /home/kwqcheii/source/research/binary/tenet/tracers/pin/obj-intel64/pintenet.so"
}

export KUBECONFIG="$HOME/.kube/config"


# . "$HOME/.rye/env"

export FPATH="$FPATH":/nix/var/nix/profiles/default/share/zsh/site-functions

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/kwqcheii/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/kwqcheii/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/kwqcheii/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/kwqcheii/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/kwqcheii/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/home/kwqcheii/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<


# bun completions
[ -s "/home/kwqcheii/.bun/_bun" ] && source "/home/kwqcheii/.bun/_bun"

# bun

export PATH="$HOME/source/vm/emu/quickemu/:$PATH"


function use_depot() {
  export PATH="/home/kwqcheii/source/chromium/depot_tools":$PATH
}


alias gef='gdb --early-init-eval-command="set auto-load safe-path /" --command=/home/kwqcheii/source/bin/gef.py'
alias kgef='gdb --early-init-eval-command="set auto-load safe-path /" --command=/home/kwqcheii/source/bin/gef.py -ex "target remote :1234"'
