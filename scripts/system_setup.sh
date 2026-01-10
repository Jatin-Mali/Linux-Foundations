#!/usr/bin/zsh

echo "Starting basic Linux system setup..."
echo "This may take a few minutes."
echo

# ---- UPDATE SYSTEM ----
echo "Updating system..."
sudo apt update
sudo apt upgrade -y

# ---- BASIC TOOLS ----
echo "Installing basic tools..."
sudo apt install -y \
  curl \
  wget \
  git \
  unzip \
  zip \
  tree

# ---- SYSTEM MONITORING ----
echo "Installing system monitoring tools..."
sudo apt install -y \
  htop \
  ncdu \
  neofetch

# ---- DEVELOPMENT TOOLS ----
echo "Installing development tools..."
sudo apt install -y \
  python3 \
  python3-pip \
  nodejs \
  npm \
  neovim \
  tmux

# ---- NETWORKING ----
echo "Installing networking tools..."
sudo apt install -y \
  net-tools \
  openssh-client \
  openssh-server

# ---- SEARCH & PRODUCTIVITY ----
echo "Installing productivity tools..."
sudo apt install -y \
  fzf \
  ripgrep

# ---- CLEANUP ----
echo "Cleaning up..."
sudo apt autoremove -y
sudo apt autoclean -y

echo
echo "System setup complete."
echo "You can now start working comfortably in the terminal."
