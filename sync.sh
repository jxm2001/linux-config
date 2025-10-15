#!/bin/bash
OS=$(cat /etc/os-release | grep '^ID=' | cut -d '=' -f 2 | sed 's/"//g')
case $OS in
	"fedora"|"centos"|"arch"|"debian"|"ubuntu")
		nvim_init_path="$HOME/.config/nvim"
	;;
	"msys2")
		nvim_init_path="$LOCALAPPDATA/nvim"
	;;
	*)
		echo "Unsupported operating system!!!"
		exit 1
	;;
esac
read -p "Choose vim version to sync(null/base/easy/coc/nvim-base/nvim-easy/nvim-lsp): " version
if [ $version == "base" ]; then
	cp ~/.vimrc ./baseVim/vimrc
elif [ $version == "easy" ]; then
	cp ~/.vimrc ./easyVim/vimrc
elif [ $version == "coc" ]; then
	cp ~/.vimrc ./cocVim/vimrc
	cp ~/.vim/coc-settings.json ./cocVim/coc-settings.json
elif [ $version == "nvim-base" ]; then
	cp $nvim_init_path/init.vim ./nvim_base/init.vim
elif [ $version == "nvim-easy" ]; then
	cp $nvim_init_path/init.vim ./nvim_easy/init.vim
	rm -rf ./nvim_easy/lua && cp -r $nvim_init_path/lua ./nvim_easy
elif [ $version == "nvim-lsp" ]; then
	cp $nvim_init_path/init.vim ./nvim_lsp/init.vim
	rm -rf ./nvim_lsp/lua && cp -r $nvim_init_path/lua ./nvim_lsp
	cp $HOME/.config/yazi/{init.lua,keymap.toml,yazi.toml} ./yazi
elif [ $version != "null" ]; then
	echo "Error vim version"
	exit 1
fi
read -p "Choose tmux version to sync(null/base/normal): " version
if [ $version == "base" ]; then
	cp ~/.tmux.conf ./tmux/baseTmux.conf
elif [ $version == "normal" ]; then
	cp ~/.tmux/tmux-status-line-trigger.tmux ./tmux/
	cp ~/.tmux.conf ./tmux/normalTmux.conf
elif [ $version != "null" ]; then
	echo "Error tmux version"
	exit 1
fi
