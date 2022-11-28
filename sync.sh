#!/bin/bash
read -p "Choose vim version to sync(null/base/easy/coc/nvim): " version
if [ $version == "base" ]; then
	cp ~/.vimrc ./baseVim/vimrc
elif [ $version == "easy" ]; then
	cp ~/.vimrc ./easyVim/vimrc
elif [ $version == "coc" ]; then
	cp ~/.vimrc ./cocVim/vimrc
	cp ~/.vim/coc-settings.json ./cocVim/coc-settings.json
elif [ $version == "nvim" ]; then
	cp ~/.config/nvim/init.vim ./neoVim/init.vim
	cp ~/.config/nvim/coc-settings.json ./neoVim/coc-settings.json
	cp -r ~/.config/nvim/lua ./neoVim
elif [ $version != "null" ]; then
	echo "Error vim version"
	exit 1
fi
read -p "Choose tmux version to sync(null/base/normal): " version
if [ $version == "base" ]; then
	cp ~/.tmux.conf ./tmux/baseTmux.conf
elif [ $version == "normal" ]; then
	cp ~/.tmux.conf ./tmux/normalTmux.conf
elif [ $version != "null" ]; then
	echo "Error tmux version"
	exit 1
fi
