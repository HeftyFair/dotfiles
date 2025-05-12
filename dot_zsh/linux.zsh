if [[ $(uname) != "Linux" ]]; then
  return 0
fi

function bt_forksnoop() {
  sudo bpftrace -e 'tracepoint:sched:sched_process_fork { printf("%s forked %d -> %d\n", comm, pid, args->child_pid); }'
}

function use_bcc() {
  export PATH="/usr/share/bcc/tools":$PATH
}

# function bcc()
# {
#   pushd "/usr/share/bcc/tools/"
#   sudo $@
#   popd
# }

function nve() {
  local PORT_NUMBER=$($(go env GOPATH)/bin/rand_port)
  local IP_ADDR=$(echo $SSH_CONNECTION | awk '{print $3}')
  local REMOTE_IP_ADDR=$(echo $SSH_CONNECTION | awk '{print $1}')
  nvim --listen $IP_ADDR:$PORT_NUMBER --headless $@ &
  # nvim --listen $IP_ADDR:$PORT_NUMBER --embed $@ &
  curl -u $(whoami):$(whoami) "http://${REMOTE_IP_ADDR}:8980/api/alias/neovide?args[]=--fork&args[]=--server&args[]=$IP_ADDR:$PORT_NUMBER"
  # kitty @ launch --type=background /opt/homebrew/bin/neovide --server $IP_ADDR:$PORT_NUMBER --no-multigrid
}


function nvimle() {
  local PORT_NUMBER=$($(go env GOPATH)/bin/rand_port)
  local IP_ADDR=$(echo $SSH_CONNECTION | awk '{print $3}')
  nvim --listen $IP_ADDR:$PORT_NUMBER --headless $@ &
  kitty @ launch --type=background /opt/homebrew/bin/neovide --server $IP_ADDR:$PORT_NUMBER --no-multigrid
}


[ -f "/home/kwqcheii/.ghcup/env" ] && . "/home/kwqcheii/.ghcup/env" # ghcup-env


#source /home/kwqcheii/source/practice/ctf/pwn/glibc-switcher/use.sh

alias gfw='sudo systemctl start mihomo'
alias wfg='sudo systemctl stop mihomo'


function enter_re() {
  # . <(nix print-dev-env $HOME/source/practice/ctf/env/re/ | awk '!/LINENO\s*=\s*/')
  nix develop $HOME/source/ctf/env/re/ --command zsh
}

function enter_pwn() {
  # . <(nix print-dev-env $HOME/source/practice/ctf/env/pwn/ | awk '!/LINENO\s*=\s*/')
  nix develop $HOME/source/ctf/env/pwn/ --command zsh
}

function enter_crypto() {
  # . <(nix print-dev-env $HOME/source/practice/ctf/env/pwn/ | awk '!/LINENO\s*=\s*/')
  nix develop $HOME/source/ctf/env/crypto/ --command zsh
}


function screenon() {
  systemctl --user start ydotool
  sleep 3
  ydotool  mousemove -x 100 -y 100
}

# Created by `pipx` on 2024-05-01 02:39:03
export PATH="$PATH:/home/kwqcheii/.local/bin"

alias nc='ncat'

function errno() {
  grep -i $1 /usr/src/linux/include/uapi/asm-generic/errno.h /usr/src/linux/include/uapi/asm-generic/errno-base.h
}

function update() {
  _update_all
  sudo pacman -Syu
}


export PATH="$HOME/source/bin:$PATH"
alias pwndbg='/home/kwqcheii/source/bin/pwndbg/bin/pwndbg'

export PATH="$HOME/source/bin/codeql:$PATH"


function pbcopy() {
  printf "\033]52;c;%s\007" "$(base64 | tr -d '\n')"
}
