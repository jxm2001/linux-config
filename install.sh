#!/bin/bash
read -p "choose vim version to install(base/easy): " version
if [ $version == "base" ]; then
	cp baseVim/vimrc ~/.vimrc
	cp tmux.conf ~/.tmux.conf
elif [ $version == "easy" ]; then
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	cp easyVim/vimrc ~/.vimrc
	cp tmux.conf ~/.tmux.conf
elif [ $version == "coc" ]; then
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	cp ./cocVim/vimrc ~/.vimrc
	cp ./cocVim/coc-settings.json ~/.vim/coc-settings.json
	cp tmux.conf ~/.tmux.conf
else
	echo "error version"
fi
