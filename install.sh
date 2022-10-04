#!/bin/bash
read -p "Choose vim version to install(null/base/easy/coc/nvim): " version
if [ $version == "base" ]; then
	cp ./baseVim/vimrc ~/.vimrc
elif [ $version == "easy" ]; then
	curl --connect-timeout 3 google.com &> /dev/null
	if [ $? -ne 0 ]; then
		echo "Network error!"
		exit 2
	fi
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	cp ./easyVim/vimrc ~/.vimrc
elif [ $version == "coc" ]; then
	curl --connect-timeout 3 google.com &> /dev/null
	if [ $? -ne 0 ]; then
		echo "Network error!"
		exit 2
	fi
	clangd --version &> /dev/null && ctags --version &> /dev/null && npm --version &> /dev/null
	if [ $? -ne 0 ]; then
		echo "Please run the following command to install the dependent environment"
		clangd --version &> /dev/null
		if [ $? -ne 0 ]; then
			echo "sudo apt install clangd"
		fi
		ctags --version &> /dev/null
		if [ $? -ne 0 ]; then
			echo "sudo apt install universal-ctags"
		fi
		node --version &> /dev/null
		if [ $? -ne 0 ]; then
			echo "curl -sL install-node.vercel.app/lts | sudo bash"
		fi
		exit 2
	fi
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	cp ./cocVim/vimrc ~/.vimrc
	cp ./cocVim/coc-settings.json ~/.vim/coc-settings.json
elif [ $version == "nvim" ]; then
	curl --connect-timeout 3 google.com &> /dev/null
	if [ $? -ne 0 ]; then
		echo "Network error!"
		exit 2
	fi
	clangd --version &> /dev/null && ctags --version &> /dev/null && npm --version &> /dev/null
	if [ $? -ne 0 ]; then
		echo "Please run the following command to install the dependent environment"
		clangd --version &> /dev/null
		if [ $? -ne 0 ]; then
			echo "sudo apt install clangd"
		fi
		ctags --version &> /dev/null
		if [ $? -ne 0 ]; then
			echo "sudo apt install universal-ctags"
		fi
		node --version &> /dev/null
		if [ $? -ne 0 ]; then
			echo "curl -sL install-node.vercel.app/lts | sudo bash"
		fi
		exit 2
	fi
	git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
	mkdir -p ~/.config/nvim
	mkdir -p ~/.config/nvim/lua
	cp ./neoVim/init.vim ~/.config/nvim/init.vim
	cp ./neoVim/plugins.lua ~/.config/nvim/lua/plugins.lua
	cp ./cocVim/coc-settings.json ~/.config/nvim/coc-settings.json 
elif [ $version != "null" ]; then
	echo "Error vim version"
	exit 1
fi
read -p "Choose tmux version to install(null/base/normal): " version
if [ $version == "base" ]; then
	cp ./tmux/baseTmux.conf ~/.tmux.conf
elif [ $version == "normal" ]; then
	curl --connect-timeout 3 google.com &> /dev/null
	if [ $? -ne 0 ]; then
		echo "Network error!"
		exit 2
	fi
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	cp ./tmux/normalTmux.conf ~/.tmux.conf
elif [ $version != "null" ]; then
	echo "Error tmux version"
	exit 1
fi
