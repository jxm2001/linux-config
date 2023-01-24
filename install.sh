#!/bin/bash
read -p "Choose vim version to install(null/base/easy/coc/baseNvim/nvim): " version
if [ $version == "base" ]; then
	cp ./baseVim/vimrc ~/.vimrc
elif [ $version == "easy" ]; then
	curl --connect-timeout 3 google.com &> /dev/null
	if [ $? -ne 0 ]; then
		echo "Network error!"
		exit 2
	fi
	if [ ! -e ~/.vim/autoload/plug.vim ]; then
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
			https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	fi
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
			echo "# If you want to install nodejs for all users, log in as root"
			echo "# Do not use 'sudo' because this command does not use the proxy in the current env"
			echo "curl -sL install-node.vercel.app/lts | bash"
		fi
		exit 2
	fi
	if [ ! -e ~/.vim/autoload/plug.vim ]; then
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
			https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	fi
	cp ./cocVim/vimrc ~/.vimrc
	cp ./cocVim/coc-settings.json ~/.vim/coc-settings.json
elif [ $version == "baseNvim" ]; then
	mkdir -p ~/.config/nvim
	cp ./baseNeoVim/init.vim ~/.config/nvim/init.vim
elif [ $version == "nvim" ]; then
	curl --connect-timeout 3 google.com &> /dev/null
	if [ $? -ne 0 ]; then
		echo "Network error!"
		exit 2
	fi
	clangd --version &> /dev/null && ctags --version &> /dev/null && npm --version &> /dev/null && tree-sitter --version &> /dev/null
	if [ $? -ne 0 ]; then
		echo "Please run the following command to install the dependent environment"
		clangd --version &> /dev/null
		if [ $? -ne 0 ]; then
			echo "sudo pacman -S clang"
		fi
		ctags --version &> /dev/null
		if [ $? -ne 0 ]; then
			echo "sudo pacman -S ctags"
		fi
		node --version &> /dev/null
		if [ $? -ne 0 ]; then
			echo "sudo pacman -S nodejs npm"
		fi
		tree-sitter --version &> /dev/null
		if [ $? -ne 0 ]; then
			echo "sudo pacman -S tree-sitter"
		fi
		exit 2
	fi
	if [ ! -e ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]; then
		git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
	fi
	mkdir -p ~/.config/nvim
	cp ./neoVim/init.vim ~/.config/nvim/init.vim
	cp ./neoVim/coc-settings.json ~/.config/nvim/coc-settings.json
	cp -r ./neoVim/lua ~/.config/nvim
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
	if [ ! -e ~/.tmux/plugins/tpm ]; then
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	fi
	cp ./tmux/normalTmux.conf ~/.tmux.conf
elif [ $version != "null" ]; then
	echo "Error tmux version"
	exit 1
fi
