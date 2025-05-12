# -----------------------------------------------------------------------------
# File Navigation Functions
# -----------------------------------------------------------------------------
function yy() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# -----------------------------------------------------------------------------
# File and Directory Listing
# -----------------------------------------------------------------------------
alias ls='eza --icons=auto'
alias l='ls'
alias la='eza --icons=auto -a'
alias ll='eza -lF --icons=auto'
alias lla='eza -la'
alias lt="eza --tree"
alias lt1="eza --tree --level=1"
alias lt2="eza --tree --level=2"
alias lls="lsd --hyperlink=always"
alias ltg='lsd --tree $(IGNORE=$(git rev-parse --show-toplevel)/.gitignore; if [ -f "$IGNORE" ]; then xargs printf " --ignore-glob=%s" < "$IGNORE"; fi)'
# alias ll='lsd -l'
# alias ls='gls'

# -----------------------------------------------------------------------------
# General Utilities
# -----------------------------------------------------------------------------
# Process management
alias psa="ps aux"
alias psg="ps aux | grep -v grep | grep -i"
alias kill9="kill -9"

# System information
alias meminfo="free -m -l -t"
alias cpuinfo="lscpu"
alias diskusage="df -h"
alias folderusage="du -sh * | sort -hr"

# Clipboard operations
alias copy="pbcopy"
alias getclip="pbpaste"

# Time and date
alias now="date +'%Y-%m-%d %H:%M:%S'"
alias timestamp="date +%s"

# Network utilities
alias myip="curl -s https://ipinfo.io/ip"
alias localip="ipconfig getifaddr en0"
alias ports="netstat -tulanp"
alias listen="lsof -i -P | grep LISTEN"

# History and search
alias h="history"
alias hg="history | grep"
alias f="find . -name"

# -----------------------------------------------------------------------------
# File System Operations
# -----------------------------------------------------------------------------
alias cx='chmod +x'
alias rp='realpath'
alias df="df -h"
alias du="du -h"
alias grep='grep --color=auto'
alias sudop='sudo env PATH=$PATH'

# -----------------------------------------------------------------------------
# Editor Shortcuts
# -----------------------------------------------------------------------------
alias n='nvim'
alias nv='nvim .'
alias nvd='neovide --fork'
alias emxc='emacsclient -nc'
alias emx='emacsclient -t'

# -----------------------------------------------------------------------------
# Git Shortcuts
# -----------------------------------------------------------------------------
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
# alias df='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias gitcam="git commit -a -m"

# -----------------------------------------------------------------------------
# Python Development
# -----------------------------------------------------------------------------
alias penv="python3 -m venv"
alias env-pipenv="echo 'layout pipenv' >> .envrc"
alias pypath='python3 -c "import sys; print(sys.path)"'
alias ipy='ipython3'
alias bpy='bpython'

# -----------------------------------------------------------------------------
# Other Development Tools
# -----------------------------------------------------------------------------
alias k='kubectl'
# alias bazel='bazelisk'
# alias s='kitten ssh'
alias bhelp='bat --plain --language=help'
help() {
    "$@" --help 2>&1 | bhelp
}

alias fabric='fabric-ai'
alias bn="binaryninja"


# -----------------------------------------------------------------------------
# Network & Utilities
# -----------------------------------------------------------------------------
alias sitecopy='wget -k -K -E -r -l 10 -p -N -F -nH '
alias ytmp3='youtube-dl --extract-audio --audio-format mp3 '

# -----------------------------------------------------------------------------
# Android Development
# -----------------------------------------------------------------------------
function adb_lldb {
    use_android
    adb shell su -c "/data/local/tmp/lldb-server platform --listen \'*:1234\' --server &"
    adb forward tcp:1234 tcp:1234
}

# -----------------------------------------------------------------------------
# Remote Tools
# -----------------------------------------------------------------------------
alias ida_server_linux="ssh -t -L 23946:localhost:23946 myhost '~/source/bin/linux_server'"
# alias ida_server_linux "ssh -t -L 23946:localhost:23946 myhost '~/source/bin/linux_server'"
alias serve='python3 -m http.server 10005 -d'





# -----------------------------------------------------------------------------
# AI-powered Git Commit Function
# -----------------------------------------------------------------------------
# Uses ollama with deepseek-r1 model to generate commit messages
gcm() {
    # Function to generate commit message
    generate_commit_message() {
        git diff --cached | ollama run deepseek-r1 "
Below is a diff of all staged changes, coming from the command:
\`\`\`
git diff --cached
\`\`\`
Please generate a concise, one-line commit message for these changes."
    }

    # Function to read user input compatibly with both Bash and Zsh
    read_input() {
        if [ -n "$ZSH_VERSION" ]; then
            echo -n "$1"
            read -r REPLY
        else
            read -p "$1" -r REPLY
        fi
    }

    # Main script
    echo "Generating AI-powered commit message..."
    commit_message=$(generate_commit_message)

    while true; do
        echo -e "\nProposed commit message:"
        echo "$commit_message"

        read_input "Do you want to (a)ccept, (e)dit, (r)egenerate, or (c)ancel? "
        choice=$REPLY

        case "$choice" in
            a|A )
                if git commit -m "$commit_message"; then
                    echo "Changes committed successfully!"
                    return 0
                else
                    echo "Commit failed. Please check your changes and try again."
                    return 1
                fi
                ;;
            e|E )
                read_input "Enter your commit message: "
                commit_message=$REPLY
                if [ -n "$commit_message" ] && git commit -m "$commit_message"; then
                    echo "Changes committed successfully with your message!"
                    return 0
                else
                    echo "Commit failed. Please check your message and try again."
                    return 1
                fi
                ;;
            r|R )
                echo "Regenerating commit message..."
                commit_message=$(generate_commit_message)
                ;;
            c|C )
                echo "Commit cancelled."
                return 1
                ;;
            * )
                echo "Invalid choice. Please try again."
                ;;
        esac
    done
}
