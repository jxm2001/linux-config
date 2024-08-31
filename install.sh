#!/bin/bash
if [ -f /etc/os-release ]; then
	OS=$(cat /etc/os-release | grep '^ID=' | cut -d '=' -f 2 | sed 's/"//g')
else
    OS="unknown"
fi
if [ "$OS" == "archarm"  ]; then
	OS="arch"
fi
case $OS in
	"arch"|"fedora"|"centos"|"debian"|"ubuntu")
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
function check_network(){
	curl --connect-timeout 3 https://google.com &> /dev/null
	if [ $? -ne 0 ]; then
		echo "Network error!"
		exit 2
	fi
}
function check_python3_neovim(){
	if [ ! -z "$(pip list 2>/dev/null | grep pynvim)" ]; then
		return 0
	fi
	case $OS in
		"arch"|"msys2")
			pacman -Ss python-pynvim | grep 'installed' &> /dev/null
		;;
		"fedora"|"centos")
			rpm -q python3-neovim &> /dev/null
		;;
		"debian"|"ubuntu")
			dpkg -l python3-neovim &> /dev/null
		;;
	esac
	return $?
}
function check_python3_setuptools(){
	case $OS in
		"arch")
			pacman -Ss python-setuptools | grep 'installed' &> /dev/null
		;;
	esac
	return 0
}
function check_python3_distutils(){
	case $OS in
		"arch")
			pacman -Ss python-distutils-extra | grep 'installed' &> /dev/null
		;;
	esac
	return 0
}
function install_luarocks(){
	case $OS in
		"arch")
			echo "sudo pacman -S luarocks"
		;;
		"fedora"|"centos")
			echo "sudo dnf install luarocks"
		;;
		"debian"|"ubuntu")
			echo "sudo apt install luarocks"
		;;
		"msys2")
			echo "pacman -S mingw-w64-x86_64-luarocks"
		;;
	esac
}
function install_clangd(){
	case $OS in
		"arch")
			echo "sudo pacman -S clang"
		;;
		"fedora"|"centos")
			echo "sudo dnf install clang-tools-extra"
		;;
		"debian"|"ubuntu")
			echo "sudo apt install clangd"
		;;
		"msys2")
			echo "pacman -S mingw-w64-x86_64-clang-tools-extra"
		;;
	esac
}
function install_ctags(){
	case $OS in
		"arch")
			echo "sudo pacman -S ctags"
		;;
		"fedora"|"centos")
			echo "sudo dnf install ctags"
		;;
		"debian"|"ubuntu")
			echo "sudo apt install universal-ctags"
		;;
		"msys2")
			echo "pacman -S mingw-w64-x86_64-ctags"
		;;
	esac
}
function install_nodejs(){
	case $OS in
		"arch")
			echo "sudo pacman -S nodejs npm"
		;;
		"fedora"|"centos")
			echo "sudo dnf install nodejs"
		;;
		"debian")
			echo "sudo apt install nodejs npm"
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
		"arch")
			echo "sudo pacman -S tree-sitter-cli"
		;;
		"fedora")
			echo "sudo dnf install tree-sitter-cli"
		;;
		"debian"|"ubuntu"|"centos")
			echo "wget https://github.com/tree-sitter/tree-sitter/releases/download/v0.22.5/tree-sitter-linux-x64.gz"
			echo "gzip -d tree-sitter-linux-x64.gz && chmod +x tree-sitter-linux-x64"
			echo "mkdir -p ~/.local/bin/ && mv tree-sitter-linux-x64 ~/.local/bin/tree-sitter"
		;;
		"msys2")
			echo "pacman -S mingw-w64-x86_64-tree-sitter"
		;;
	esac
}
function install_python3_neovim(){
	case $OS in
		"arch")
			echo "sudo pacman -S python-pynvim"
		;;
		"fedora"|"centos")
			echo "sudo dnf install python3-neovim"
		;;
		"debian"|"ubuntu")
			echo "sudo apt install --no-install-recommends python3-neovim"
		;;
		"msys2")
			echo "pacman -S mingw-w64-x86_64-python-pynvim"
		;;
	esac
}
function install_python3_setuptools(){
	case $OS in
		"arch")
			echo "sudo pacman -S python-setuptools"
		;;
	esac
}
function install_python3_distutils(){
	case $OS in
		"arch")
			echo "sudo pacman -S python-distutils-extra"
		;;
	esac
}
function install_vim(){
	read -p "Choose vim version to install(null/base/easy/coc/nvim-base/nvim-easy/nvim-coc): " version
	if [ $version == "base" ]; then
		cp ./baseVim/vimrc ~/.vimrc
	elif [ $version == "easy" ]; then
		if [ ! -e ~/.vim/autoload/plug.vim ]; then
			check_network
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
		if [ ! -e ~/.vim/autoload/plug.vim ]; then
			check_network
			curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
				https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		fi
		cp ./cocVim/vimrc ~/.vimrc
		cp ./cocVim/coc-settings.json ~/.vim/coc-settings.json
	elif [ $version == "nvim-base" ]; then
		mkdir -p $nvim_init_path
		cp ./nvim_base/init.vim $nvim_init_path/init.vim
		cp -r ./nvim_base/lua $nvim_init_path
	elif [ $version == "nvim-easy" ]; then
		if [ ! -e $nvim_packer_path/site/pack/packer/start/packer.nvim ]; then
			check_network
			git clone --depth 1 https://github.com/wbthomason/packer.nvim $nvim_packer_path/site/pack/packer/start/packer.nvim
		fi
		mkdir -p $nvim_init_path
		cp ./nvim_easy/init.vim $nvim_init_path/init.vim
		cp -r ./nvim_easy/lua $nvim_init_path
	elif [ $version == "nvim-coc" ]; then
		luarocks --version &> /dev/null && clangd --version &> /dev/null && ctags --version &> /dev/null \
			&& node --version &> /dev/null && npm --version &> /dev/null && tree-sitter --version &> /dev/null && check_python3_neovim
		if [ $? -ne 0 ]; then
			echo "Please run the following command to install the dependent environment"
			luarocks --version &> /dev/null
			if [ $? -ne 0 ]; then
				install_luarocks
			fi
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
			check_python3_setuptools
			if [ $? -ne 0 ]; then
				install_python3_setuptools
			fi
			check_python3_distutils
			if [ $? -ne 0 ]; then
				install_python3_distutils
			fi
			exit 2
		fi
		check_network
		mkdir -p $nvim_init_path
		cp ./nvim_coc/init.vim $nvim_init_path/init.vim
		cp -r ./nvim_coc/lua $nvim_init_path
		mkdir -p $nvim_coc_setting_path
		cp ./nvim_coc/coc-settings.json $nvim_coc_setting_path/coc-settings.json
	elif [ $version != "null" ]; then
		echo "Error vim version"
		exit 1
	fi
}
function install_tmux(){
	read -p "Choose tmux version to install(null/base/normal): " version
	if [ $version == "base" ]; then
		cp ./tmux/baseTmux.conf ~/.tmux.conf
		if [ $OS == "msys2" ]; then
			dos2unix ~/.tmux.conf
		fi
	elif [ $version == "normal" ]; then
		if [ ! -e ~/.tmux/plugins/tpm ]; then
			check_network
			git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm
		fi
		cp ./tmux/normalTmux.conf ~/.tmux.conf
		cp ./tmux/tmux-status-line-trigger.tmux ~/.tmux/
		if [ $OS == "msys2" ]; then
			dos2unix ~/.tmux.conf
		fi
	elif [ $version != "null" ]; then
		echo "Error tmux version"
		exit 1
	fi
}
function install_zsh(){
	read -p "Choose zsh version to install(null/manual/zinit): " version
	if [ $version == "zinit" ]; then
		wget --version &> /dev/null && curl --version &> /dev/null && tar --version &> /dev/null && jq --version &> /dev/null
		if [ $? -ne 0 ]; then
			echo "Fail to install zsh"
			wget --version &> /dev/null
			if [ $? -ne 0 ]; then
				echo "Please install wget"
			fi
			curl --version &> /dev/null
			if [ $? -ne 0 ]; then
				echo "Please install curl"
			fi
			tar --version &> /dev/null
			if [ $? -ne 0 ]; then
				echo "Please install tar"
			fi
			jq --version &> /dev/null
			if [ $? -ne 0 ]; then
				echo "Please install jq"
			fi
			exit 2
		fi
		check_network
		cp ./zsh/zinit/zshrc.1 ~/.zshrc
		bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
		echo "" >> ~/.zshrc
		cat ./zsh/zinit/zshrc.2 >> ~/.zshrc
		cp ./zsh/zsh_aliases ~/.zsh_aliases
	elif [ $version == "manual" ]; then
		wget --version &> /dev/null && curl --version &> /dev/null && tar --version &> /dev/null
		if [ $? -ne 0 ]; then
			echo "Fail to install zsh"
			wget --version &> /dev/null
			if [ $? -ne 0 ]; then
				echo "Please install wget"
			fi
			curl --version &> /dev/null
			if [ $? -ne 0 ]; then
				echo "Please install curl"
			fi
			tar --version &> /dev/null
			if [ $? -ne 0 ]; then
				echo "Please install tar"
			fi
			exit 2
		fi
		check_network
		cp ./zsh/manual/zshrc ~/.zshrc
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
		cp ./zsh/zsh_aliases ~/.zsh_aliases
	elif [ $version != "null" ]; then
		echo "Error zsh version"
		exit 1
	fi
}
install_zsh
install_vim
install_tmux
