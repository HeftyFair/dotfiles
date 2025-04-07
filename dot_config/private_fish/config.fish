if status is-interactive
    # Commands to run in interactive sessions can go here
    source (starship init fish --print-full-init | psub)
end

zoxide init fish | source

fzf --fish | source

function nvimle
    set -l PORT_NUMBER (rand_port)
    set -l IP_ADDR (echo $SSH_CONNECTION | awk '{print $3}')
    nvim --listen $IP_ADDR:$PORT_NUMBER --headless $argv &
    #kitty @ launch neovide --fork --server $IP_ADDR:$PORT_NUMBER
    #kitty @ run /opt/homebrew/bin/neovide --server $IP_ADDR:$PORT_NUMBER
    kitten @ launch --type=background /opt/homebrew/bin/neovide --server $IP_ADDR:$PORT_NUMBER
end

direnv hook fish | source


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/kwqcheii/miniconda3/bin/conda
    eval /home/kwqcheii/miniconda3/bin/conda "shell.fish" hook $argv | source
else
    if test -f "/home/kwqcheii/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/kwqcheii/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH /home/kwqcheii/miniconda3/bin $PATH
    end
end
# <<< conda initialize <<<


# source /opt/homebrew/opt/asdf/libexec/asdf.fish

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/andreigavrilov/.cache/lm-studio/bin
