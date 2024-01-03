all: packages brave terminator actions_for_nautilus zshell oh_my_zsh oh_my_zsh_cfg gnome-extensions kubectl docker go

packages:
	sudo dnf update -y
	sudo dnf install -y \
	htop \
    autoconf \
	automake \
	ant \
    maven \
    jq \
    gcc \
    kernel-headers \
    kernel-devel

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
	touch ~/.zshrc

oh_my_zsh: zshell
	wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O /tmp/install.sh
	chmod +x /tmp/install.sh
	sh /tmp/install.sh

oh_my_zsh_cfg:
	cp configs/zsh/zshrc ~/.zshrc

gnome-extensions:
	brave-browser https://extensions.gnome.org/extension/3843/just-perfection/
	brave-browser https://extensions.gnome.org/local/
	brave-browser https://extensions.gnome.org/extension/5470/weather-oclock/
	brave-browser https://extensions.gnome.org/extension/906/sound-output-device-chooser/

KUBE_VERSION := $(shell curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)
kubectl:
	wget -O /tmp/kubect https://storage.googleapis.com/kubernetes-release/release/$(KUBE_VERSION)/bin/linux/amd64/kubectl
	sudo cp /tmp/kubect /usr/local/bin/kubectl
	sudo chmod +x /usr/local/bin/kubectl

docker:
	sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
	sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
	sudo systemctl enable docker --now
	sudo usermod -aG docker $$USER
	newgrp docker

go:
	wget -O /tmp/go.tar.gz https://go.dev/dl/go1.21.5.linux-amd64.tar.gz
	sudo tar -C /usr/local -xzf /tmp/go.tar.gz
