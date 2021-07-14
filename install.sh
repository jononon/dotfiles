#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # ...
        echo "==== Apt Upgrade ===="
        sudo apt-get --yes update
        sudo apt-get --yes upgrade
        echo "==== Installing ZSH ===="
        sudo apt --yes install zsh
        echo "==== Setting ZSH as default shell ===="
        sudo chsh -s $(which zsh) $(whoami)
        echo "==== Installing P10K ===="
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
        echo "==== Installing fasd ===="
        sudo add-apt-repository ppa:aacebedo/fasd
        sudo apt-get --yes update
        sudo apt-get --yes install fasd

        echo "==== Installing Python ===="
        sudo apt install python3-dev python3-pip python3-setuptools

        echo "==== Installing thefuck ===="
        sudo pip3 install thefuck

        echo "==== Installing zshrc ===="
        cp .zshrc $HOME/.zshrc
        echo "==== Installing custom comands ===="
        cp .jonathan_damico_custom_commands.sh $HOME/.jonathan_damico_custom_commands.sh
        echo "==== Installing vimrc ===="
        cp .vimrc $HOME/.vimrc
        echo "==== Installing p10k config ===="
        cp .p10k.zsh $HOME/.p10k.zsh


        echo "==== Installing oh my ZSH ===="
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc

elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
        echo "==== Installing brew ===="
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo "==== Installing ZSH ===="
        brew install zsh
        echo "==== Setting ZSH as default shell ===="
        chsh -s $(which zsh)
        echo "==== Installing P10K ===="
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
        echo "==== Installing fasd ===="
        brew install fasd
        echo "==== Installing thefuck ===="
        brew install thefuck

        echo "==== Installing zshrc ===="
        cp .zshrc $HOME/.zshrc
        echo "==== Installing custom comands ===="
        cp .jonathan_damico_custom_commands.sh $HOME/.jonathan_damico_custom_commands.sh
        echo "==== Installing vimrc ===="
        cp .vimrc $HOME/.vimrc
        
        echo "==== Installing p10k config ===="
        cp .p10k.zsh $HOME/.p10k.zsh

        echo "==== Installing oh my ZSH ===="
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc
# elif [[ "$OSTYPE" == "cygwin" ]]; then
#         # POSIX compatibility layer and Linux environment emulation for Windows
# elif [[ "$OSTYPE" == "msys" ]]; then
#         # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
# elif [[ "$OSTYPE" == "win32" ]]; then
#         # I'm not sure this can happen.
# elif [[ "$OSTYPE" == "freebsd"* ]]; then
#         # ...
# else
#         # Unknown.
fi


