#!/bin/bash
OS=$(cat /etc/os-release | grep '^ID=' | cut -d '=' -f 2)
case $OS in
	"fedora"|"arch"|"ubuntu")
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
function check_python3_neovim(){
	case $OS in
		"fedora")
			rpm -q python3-neovim &> /dev/null
		;;
		"arch"|"msys2")
			pacman -Ss python-pynvim | grep 'installed' &> /dev/null
		;;
		"ubuntu")
			dpkg -l python3-neovim &> /dev/null
		;;
	esac
	return $?
}
function install_clangd(){
	case $OS in
		"fedora")
			echo "sudo dnf install clang-tools-extra"
		;;
		"arch")
			echo "sudo pacman -S clang"
		;;
		"ubuntu")
			echo "sudo apt install clangd"
		;;
		"msys2")
			echo "pacman -S mingw-w64-x86_64-clang-tools-extra"
		;;
	esac
}
function install_ctags(){
	case $OS in
		"fedora")
			echo "sudo dnf install ctags"
		;;
		"arch")
			echo "sudo pacman -S ctags"
		;;
		"ubuntu")
			echo "sudo apt install universal-ctags"
		;;
		"msys2")
			echo "pacman -S mingw-w64-x86_64-ctags"
		;;
	esac
}
function install_nodejs(){
	case $OS in
		"fedora")
			echo "sudo dnf install nodejs"
		;;
		"arch")
			echo "sudo pacman -S nodejs npm"
		;;
		"ubuntu")
			echo "# If you want to install nodejs for all users, log in as root"
			echo "# Do not use 'sudo' because this command does not use the proxy in the current env"
			echo "curl -sL install-node.vercel.app/lts | bash"
		;;
		"msys2")
			echo "pacman -S mingw-w64-x86_64-nodejs"
		;;
	esac
}
function install_tree_sitter(){
	case $OS in
		"fedora")
			echo "sudo dnf install tree-sitter-cli"
		;;
		"arch")
			echo "sudo pacman -S tree-sitter"
		;;
		"ubuntu")
			echo "wget https://github.com/tree-sitter/tree-sitter/releases/download/v0.20.7/tree-sitter-linux-x64.gz"
			echo "gzip -d tree-sitter-linux-x64.gz"
			echo "mv tree-sitter-linux-x64 ~/.local/bin/tree-sitter"
		;;
		"msys2")
			echo "pacman -S mingw-w64-x86_64-tree-sitter"
		;;
	esac
}
function install_python3_neovim(){
	case $OS in
		"fedora")
			echo "sudo dnf install python3-neovim"
		;;
		"arch")
			echo "sudo pacman -S python-pynvim"
		;;
		"ubuntu")
			echo "sudo apt install python3-neovim"
		;;
		"msys2")
			echo "pacman -S mingw-w64-x86_64-python-pynvim"
		;;
	esac
}
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
	clangd --version &> /dev/null && ctags --version &> /dev/null && node --version &> /dev/null && npm --version &> /dev/null
	if [ $? -ne 0 ]; then
		echo "Please run the following command to install the dependent environment"
		clangd --version &> /dev/null
		if [ $? -ne 0 ]; then
			install_clangd
		fi
		ctags --version &> /dev/null
		if [ $? -ne 0 ]; then
			install_ctags
		fi
		node --version &> /dev/null && npm --version &> /dev/null
		if [ $? -ne 0 ]; then
			install_nodejs
		fi
		exit 2
	fi
	curl --connect-timeout 3 google.com &> /dev/null
	if [ $? -ne 0 ]; then
		echo "Network error!"
		exit 2
	fi
	if [ ! -e ~/.vim/autoload/plug.vim ]; then
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
			https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	fi
	cp ./cocVim/vimrc ~/.vimrc
	cp ./cocVim/coc-settings.json ~/.vim/coc-settings.json
elif [ $version == "baseNvim" ]; then
	mkdir -p $nvim_init_path
	cp ./baseNeoVim/init.vim $nvim_init_path/init.vim
elif [ $version == "nvim" ]; then
	clangd --version &> /dev/null && ctags --version &> /dev/null && node --version &> /dev/null \
		&& npm --version &> /dev/null && tree-sitter --version &> /dev/null && check_python3_neovim
	if [ $? -ne 0 ]; then
		echo "Please run the following command to install the dependent environment"
		clangd --version &> /dev/null
		if [ $? -ne 0 ]; then
			install_clangd
		fi
		ctags --version &> /dev/null
		if [ $? -ne 0 ]; then
			install_ctags
		fi
		node --version &> /dev/null && npm --version &> /dev/null
		if [ $? -ne 0 ]; then
			install_nodejs
		fi
		tree-sitter --version &> /dev/null
		if [ $? -ne 0 ]; then
			install_tree_sitter
		fi
		check_python3_neovim
		if [ $? -ne 0 ]; then
			install_python3_neovim
		fi
		exit 2
	fi
	curl --connect-timeout 3 google.com &> /dev/null
	if [ $? -ne 0 ]; then
		echo "Network error!"
		exit 2
	fi
	if [ ! -e $nvim_packer_path/site/pack/packer/start/packer.nvim ]; then
		git clone --depth 1 https://github.com/wbthomason/packer.nvim $nvim_packer_path/site/pack/packer/start/packer.nvim
	fi
	mkdir -p $nvim_init_path
	cp ./neoVim/init.vim $nvim_init_path/init.vim
	cp -r ./neoVim/lua $nvim_init_path
	mkdir -p $nvim_coc_setting_path
	cp ./neoVim/coc-settings.json $nvim_coc_setting_path/coc-settings.json
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
read -p "Choose zsh version to install(null/normal): " version
if [ $version == "normal" ]; then
	curl --connect-timeout 3 google.com &> /dev/null
	if [ $? -ne 0 ]; then
		echo "Network error!"
		exit 2
	fi
	cp ./zshrc ~/.zshrc
	mkdir -p ~/.zsh/themes
	mkdir -p ~/.zsh/plugins
	if [ ! -e ~/.zsh/themes/powerlevel10k ]; then
		git clone https://github.com/romkatv/powerlevel10k.git ~/.zsh/themes/powerlevel10k
	fi
	if [ ! -e ~/.zsh/plugins/zsh-syntax-highlighting ]; then
		git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/plugins/zsh-syntax-highlighting
	fi
	if [ ! -e ~/.zsh/plugins/zsh-autosuggestions ]; then
		git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/plugins/zsh-autosuggestions
	fi
	if [ ! -e ~/.zsh/plugins/zsh-completions ]; then
		git clone https://github.com/zsh-users/zsh-completions.git ~/.zsh/plugins/zsh-completions
	fi
	if [ ! -e ~/.zsh/plugins/z ]; then
		git clone https://github.com/rupa/z.git ~/.zsh/plugins/z
	fi
	if [ ! -e ~/.zsh/plugins/fzf ]; then
		git clone https://github.com/junegunn/fzf.git ~/.zsh/plugins/fzf
		~/.zsh/plugins/fzf/install --xdg --key-bindings --completion --update-rc
	fi
elif [ $version != "null" ]; then
	echo "Error zsh version"
	exit 1
fi
