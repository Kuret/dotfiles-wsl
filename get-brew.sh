if [[ "$OSTYPE" == "linux"* ]]; then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
        echo 'export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"' >>~/.profile
elif [[ "$OSTYPE" == "darwin"* ]]; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew tap caskroom/cask
fi

