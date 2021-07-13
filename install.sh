#!/bin/sh

echo "==== Installing ZSH ===="

# Detect machine
unameOut="$(uname -s)"
case "${unameOut}" in
  Linux*)     MACHINE=Linux;;
  Darwin*)    MACHINE=Mac;;
  CYGWIN*)    MACHINE=Cygwin;;
  MINGW*)     MACHINE=MinGw;;
  *)          MACHINE="UNKNOWN:${unameOut}"
esac

echo $MACHINE

# Installs .oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  # Installs Oh my ZSH with Homebrew (Mac)
  if [[ $MACHINE == "Mac" ]]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi

  # Installs Oh my ZSH with Linux
  if [[ $MACHINE == "Linux" ]]; then
    sudo apt install zsh -y
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  fi
fi

# Assumes default ZSH installation
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

# Installs plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Fix permissions
chmod 700 ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "==== Setting ZSH as default shell ===="

chsh -s $(which zsh)

echo "==== Installing P10K ===="

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # ...
        echo "==== Installing fasd ===="
        sudo add-apt-repository ppa:aacebedo/fasd
        sudo apt-get update
        sudo apt-get install fasd

        echo "==== Installing Python ===="
        sudo apt install python3-dev python3-pip python3-setuptools

        echo "==== Installing thefuck ===="
        sudo pip3 install thefuck

elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
        echo "==== Installing brew ===="
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo "==== Installing fasd ===="
        brew install fasd
        echo "==== Installing thefuck ===="
        brew install thefuck
elif [[ "$OSTYPE" == "cygwin" ]]; then
        # POSIX compatibility layer and Linux environment emulation for Windows
elif [[ "$OSTYPE" == "msys" ]]; then
        # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
elif [[ "$OSTYPE" == "win32" ]]; then
        # I'm not sure this can happen.
elif [[ "$OSTYPE" == "freebsd"* ]]; then
        # ...
else
        # Unknown.
fi

echo "==== Installing zshrc ===="
cp .zshrc $HOME/.zshrc
echo "==== Installing custom comands ===="
cp .jonathan_damico_custom_commands.sh $HOME/.jonathan_damico_custom_commands.sh
echo "==== Installing p10k config ===="
cp .p10k.zsh $HOME/.p10k.zsh

