#!/bin/bash
OS=$(cat /etc/os-release | grep '^ID=' | cut -d '=' -f 2 | sed 's/"//g')
case $OS in
	"fedora"|"centos"|"arch"|"debian"|"ubuntu")
		nvim_init_path="$HOME/.config/nvim"
		nvim_coc_setting_path="$HOME/.config/nvim"
		nvim_packer_path="$HOME/.local/share/nvim"
	;;
	"msys2")
		nvim_init_path="$LOCALAPPDATA/nvim"
		nvim_coc_setting_path="$HOME/AppData/Local/nvim"
		nvim_packer_path="$LOCALAPPDATA/nvim-data"
	;;
	*)
		echo "Unsupported operating system!!!"
		exit 1
	;;
esac
read -p "Choose vim version to install(null/base/easy/coc/nvim-base/nvim-easy/nvim-coc): " version
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
elif [ $version == "nvim-coc" ]; then
	cp $nvim_init_path/init.vim ./nvim_coc/init.vim
	rm -rf ./nvim_coc/lua && cp -r $nvim_init_path/lua ./nvim_coc
	cp $nvim_coc_setting_path/coc-settings.json ./nvim_coc/coc-settings.json
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
