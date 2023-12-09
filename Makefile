brave:
	sudo dnf install dnf-plugins-core
	sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
	sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
	sudo dnf install -y brave-browser

terminator:
	sudo dnf install -y terminator
	cp -r configs/terminator ~/.config/

actions_for_nautilus:
	mkdir -p ~/apps
	sudo dnf install -y nautilus-python python3-gobject procps-ng js-jquery
	cd ~/apps && \
	git clone https://github.com/bassmanitram/actions-for-nautilus.git && \
	cd actions-for-nautilus && \
	make install

	cp -r configs/actions-for-nautilus ~/.local/share/actions-for-nautilus/

zshell:
	sudo dnf install -y zsh
	@echo ---------------------------------
	@echo "Changing default shell to zsh"
	@echo "When asked about the new shell, type /bin/zsh"
	@echo ---------------------------------
	sudo lchsh $(USER)
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	cp configs/zsh/zshrc ~/.zshrc
