#!/bin/sh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

chsh -s $(which zsh)

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # ...
        sudo apt install python3-dev python3-pip python3-setuptools
        sudo pip3 install thefuck
        sudo add-apt-repository ppa:aacebedo/fasd
        sudo apt-get update
        sudo apt-get install fasd
elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        brew install fasd
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

cp .jonathan_damico_custom_commands.sh $HOME/.jonathan_damico_custom_commands.sh
cp .p10k.zsh $HOME/.p10k.zsh
cp .zshrc $HOME/.zshrc
