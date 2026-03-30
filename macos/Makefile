all: brew peripherals desktop dock top-nav terminal oh_my_zsh oh_my_zsh_cfg cli-utils nvim nvim-config ides k9s docker java

# Packager manager for MacOS
brew:
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	@echo "" >> ~/.zprofile
	@echo 'eval "$$(/opt/homebrew/bin/brew shellenv zsh)"' >> ~/.zprofile
	@eval "$$(/opt/homebrew/bin/brew shellenv zsh)"


# Mouse and Keyboard configs
peripherals:
	brew install --cask linearmouse
	defaults write -g ApplePressAndHoldEnabled -bool false
	defaults write -g InitialKeyRepeat -int 14
	defaults write -g KeyRepeat -int 3


# Desktop environment and navigation
desktop:
	brew install --cask betterdisplay
	brew install --cask nikitabobko/tap/aerospace
	cp .aerospace.toml ~/.aerospace.toml
	brew install --cask alfred
	defaults write com.apple.finder QuitMenuItem -bool true
	@echo "===== configuration ===="
	@echo "Go to System > Keyboard > Keyboard Shortcuts > Spotlight and disable the Search"

# Removing dock
dock:
	defaults write com.apple.dock orientation -string left	
	defaults write com.apple.dock tilesize -int 32
	defaults write com.apple.dock autohide -bool true
	defaults write com.apple.dock autohide-time-modifier -float 0.5
	killall Dock

# Adding Mac stats and notifications widget
top-nav:
	brew install --cask doll
	brew install --cask stats	


# Ghostty terminal and config
terminal:
	brew install wget
	brew install --cask ghostty
	mkdir -p ~/.config/ghostty
	cp ../configs/ghostty/config ~/.config/ghostty/config

# Zsh Configs
oh_my_zsh:
	wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O /tmp/install.sh
	chmod +x /tmp/install.sh
	sh /tmp/install.sh

oh_my_zsh_cfg:
	cp ../configs/zsh/zshrc ~/.zshrc

# CLI utilities
cli-utils:
	curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
	brew install fzf
	brew install ripgrep

# Nvim and LazyVim config
nvim:
	brew install neovim

nvim-config:
	mkdir -p ~/.local/share/fonts
	cd ~/.local/share/fonts && \
		curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/DroidSansMNerdFont-Regular.otf
	curl -sS https://webi.sh/vim-devicons | sh
	mkdir -p ~/.config/nvim
	cp -a ../configs/nvim/. ~/.config/nvim/

helix:
	brew install --cask helix
	cp -r ../configs/helix ~/.config/helix


# IDEs
ides:
	brew install --cask bruno
	brew install --cask visual-studio-code
	brew install --cask android-studio
	brew install --cask dbeaver-community

# K9s and K9s light theme config
k9s:
	brew install k9s
	rm -rf ~/Library/Application\ Support/k9s/
	cp -R ../configs/k9s/. ~/.config/k9s
	ln -s ~/.config/k9s/ ~/Library/Application\ Support/k9s

# Docker and Colime runtime
docker:
	brew install docker
	brew install docker-compose
	brew install colima

java:
	brew install openjdk
