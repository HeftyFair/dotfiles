#!/bin/bash

# sudo apt update && sudo apt install zoxide fzf bat atuin fastfetch
setup_opensuse() {
  sudo zypper update
  sudo zypper in zsh git zoxide fzf bat eza atuin fastfetch ripgrep neovim rsync tailscale starship direnv fd yazi
  sudo zypper in cmake syncthing
  sudo zypper in htop btop
}

function install_useful_tools() {
    echo "Installing useful command-line tools..."

    # Add necessary repositories
    sudo apt update

    # System monitoring and performance tools
    sudo apt install -y \
        htop btop nvtop \
        iotop sysstat \
        strace ltrace \
        smartmontools \
        inxi \
        net-tools \
        nmap \
        wireshark \
        bpfcc-tools \
        bpftrace

    # Development tools
    sudo apt install -y \
        git \
        gh \
        ripgrep \
        fd-find \
        bat \
        eza \
        lsd \
        fzf \
        zoxide \
        direnv \
        starship \
        just \
        mold \
        bear \
        clang \
        llvm \
        cmake \
        pahole \
        nodejs npm

    # Install Rust
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

    # Text processing and utilities
    sudo apt install -y \
        jq \
        bc \
        wget \
        rsync \
        unzip \
        screen \
        tmux \
        man-db \
        manpages-dev \
        less \
        nano \
        vim \
        neovim

    # Network tools
    sudo apt install -y \
        wireguard \
        openbsd-netcat \
        iwd \
        network-manager

    # Install Tailscale
    # curl -fsSL https://tailscale.com/install.sh | sh

    # Install Syncthing
    # curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
    # echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
    # sudo apt update
    # sudo apt install -y syncthing

    # Shell and terminal tools
    sudo apt install -y \
        zsh \
        fastfetch

    chsh -s "$(which zsh)"

    # Install Atuin
    curl https://raw.githubusercontent.com/atuinsh/atuin/main/install.sh | bash

    # Security tools
    sudo apt install -y \
        checksec \
        radare2 \
        z3

    # Package management
    # sudo apt install -y \
    #     flatpak \
    #     snapd
    cd && sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply https://github.com/HeftyFair/dotfiles.git

    echo "Installation complete!"
}
