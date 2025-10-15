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
	;;
	"msys2")
		nvim_init_path="$LOCALAPPDATA/nvim"
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

function check_git() {
	if which git &> /dev/null; then return 0; fi
	echo -e "\033[1;31mError: Missing git. Run the following command to install:\033[0m"
	case $OS in
		"arch") echo "sudo pacman -S git" ;;
		"fedora"|"centos") echo "sudo dnf install git" ;;
		"debian"|"ubuntu") echo "sudo apt install git" ;;
		"msys2") echo "pacman -S git" ;;
	esac
	return 1
}

function check_curl() {
	if which curl &> /dev/null; then return 0; fi
	echo -e "\033[1;31mError: Missing curl. Run the following command to install:\033[0m"
	case $OS in
		"arch") echo "sudo pacman -S curl" ;;
		"fedora"|"centos") echo "sudo dnf install curl" ;;
		"debian"|"ubuntu") echo "sudo apt install curl" ;;
		"msys2") echo "pacman -S curl" ;;
	esac
	return 1
}

function check_wget() {
	if which wget &> /dev/null; then return 0; fi
	echo -e "\033[1;31mError: Missing wget. Run the following command to install:\033[0m"
	case $OS in
		"arch") echo "sudo pacman -S wget" ;;
		"fedora"|"centos") echo "sudo dnf install wget" ;;
		"debian"|"ubuntu") echo "sudo apt install wget" ;;
		"msys2") echo "pacman -S wget" ;;
	esac
	return 1
}

function check_unzip() {
	if which unzip &> /dev/null; then return 0; fi
	echo -e "\033[1;31mError: Missing unzip. Run the following command to install:\033[0m"
	case $OS in
		"arch") echo "sudo pacman -S unzip" ;;
		"fedora"|"centos") echo "sudo dnf install unzip" ;;
		"debian"|"ubuntu") echo "sudo apt install unzip" ;;
		"msys2") echo "pacman -S unzip" ;;
	esac
	return 1
}

function check_tar() {
	if which tar &> /dev/null; then return 0; fi
	echo -e "\033[1;31mError: Missing tar. Run the following command to install:\033[0m"
	case $OS in
		"arch") echo "sudo pacman -S tar" ;;
		"fedora"|"centos") echo "sudo dnf install tar" ;;
		"debian"|"ubuntu") echo "sudo apt install tar" ;;
		"msys2") echo "pacman -S tar" ;;
	esac
	return 1
}

function check_gzip() {
	if which gzip &> /dev/null; then return 0; fi
	echo -e "\033[1;31mError: Missing gzip. Run the following command to install:\033[0m"
	case $OS in
		"arch") echo "sudo pacman -S gzip" ;;
		"fedora"|"centos") echo "sudo dnf install gzip" ;;
		"debian"|"ubuntu") echo "sudo apt install gzip" ;;
		"msys2") echo "pacman -S gzip" ;;
	esac
	return 1
}

function check_jq() {
	if which jq &> /dev/null; then return 0; fi
	echo -e "\033[1;31mError: Missing jq. Run the following command to install:\033[0m"
	case $OS in
		"arch") echo "sudo pacman -S jq" ;;
		"fedora"|"centos") echo "sudo dnf install jq" ;;
		"debian"|"ubuntu") echo "sudo apt install jq" ;;
		"msys2") echo "pacman -S jq" ;;
	esac
	return 1
}

function check_luarocks() {
	if which luarocks &> /dev/null; then return 0; fi
	echo -e "\033[1;31mError: Missing luarocks. Run the following command to install:\033[0m"
	case $OS in
		"arch") echo "sudo pacman -S luarocks" ;;
		"fedora"|"centos") echo "sudo dnf install luarocks" ;;
		"debian"|"ubuntu") echo "sudo apt install luarocks" ;;
		"msys2") echo "pacman -S mingw-w64-x86_64-luarocks" ;;
	esac
	return 1
}

function check_clangd() {
	if which clangd &> /dev/null; then return 0; fi
	echo -e "\033[1;31mError: Missing clangd. Run the following command to install:\033[0m"
	case $OS in
		"arch") echo "sudo pacman -S clang" ;;
		"fedora"|"centos") echo "sudo dnf install clang-tools-extra" ;;
		"debian"|"ubuntu") echo "sudo apt install clangd" ;;
		"msys2") echo "pacman -S mingw-w64-x86_64-clang-tools-extra" ;;
	esac
	return 1
}

function check_ctags() {
	if which ctags &> /dev/null; then return 0; fi
	echo -e "\033[1;31mError: Missing ctags. Run the following command to install:\033[0m"
	case $OS in
		"arch") echo "sudo pacman -S ctags" ;;
		"fedora"|"centos") echo "sudo dnf install ctags" ;;
		"debian"|"ubuntu") echo "sudo apt install universal-ctags" ;;
		"msys2") echo "pacman -S mingw-w64-x86_64-ctags" ;;
	esac
	return 1
}

function check_nodejs() {
	if which node &> /dev/null && which npm &> /dev/null; then return 0; fi
	echo -e "\033[1;31mError: Missing nodejs/npm. Run the following command to install:\033[0m"
	case $OS in
		"arch") echo "sudo pacman -S nodejs npm" ;;
		"fedora"|"centos") echo "sudo dnf install nodejs" ;;
		"debian") echo "sudo apt install nodejs npm" ;;
		"ubuntu") echo "curl -sfLS install-node.vercel.app/lts | bash -s -- --prefix=$HOME/.local --verbose" ;;
		"msys2") echo "pacman -S mingw-w64-x86_64-nodejs" ;;
	esac
	return 1
}

function check_tree_sitter() {
	if which tree-sitter &> /dev/null; then return 0; fi
	echo -e "\033[1;31mError: Missing tree-sitter. Run the following command to install:\033[0m"
	case $OS in
		"arch") echo "sudo pacman -S tree-sitter-cli" ;;
		"fedora") echo "sudo dnf install tree-sitter-cli" ;;
		"debian"|"ubuntu"|"centos")
			echo "wget https://github.com/tree-sitter/tree-sitter/releases/download/v0.25.3/tree-sitter-linux-x64.gz"
			echo "gzip -d tree-sitter-linux-x64.gz && chmod +x tree-sitter-linux-x64"
			echo "mkdir -p ~/.local/bin/ && mv tree-sitter-linux-x64 ~/.local/bin/tree-sitter"
			;;
		"msys2") echo "pacman -S mingw-w64-x86_64-tree-sitter" ;;
	esac
	return 1
}

function check_yazi() {
	if which yazi &> /dev/null; then return 0; fi
	echo -e "\033[1;31mError: Missing yazi. Run the following command to install:\033[0m"
	case $OS in
		"arch") echo "sudo pacman -S yazi" ;;
		"debian"|"ubuntu"|"centos"|"fedora")
			echo "wget https://github.com/sxyazi/yazi/releases/download/v25.4.8/yazi-x86_64-unknown-linux-musl.zip"
			echo "unzip yazi-x86_64-unknown-linux-musl.zip"
			echo "mkdir -p ~/.local/bin/ && mv yazi-x86_64-unknown-linux-musl/{ya,yazi} ~/.local/bin/"
			;;
		"msys2") echo -e "\033[1;31m# Install via https://yazi-rs.github.io/docs/installation\033[0m" ;;
	esac
	return 1
}

function check_pip() {
	if which pipx &> /dev/null; then return 0; fi
	if which conda &> /dev/null; then
		if conda list pip &> /dev/null; then return 0; fi
	fi
	echo -e "\033[1;31mError: Missing usable pip. Run the following command to install:\033[0m"
	case $OS in
		"arch") echo "sudo pacman -S python-pipx # or sudo pacman -S miniconda3" ;;
		"fedora"|"centos") echo "sudo dnf install pipx # or sudo dnf install miniconda" ;;
		"debian"|"ubuntu") echo "sudo apt install pipx # or install miniconda manually" ;;
		"msys2") echo "pacman -S python-pipx # or pacman -S miniconda" ;;
	esac
	return 1
}

function check_python3_neovim() {
	if pip list 2>/dev/null | grep -q pynvim; then return 0; fi
	case $OS in
		"arch"|"msys2")
			pacman -Qs python-pynvim &> /dev/null && return 0
			;;
		"fedora"|"centos")
			rpm -q python3-neovim &> /dev/null && return 0
			;;
		"debian"|"ubuntu")
			dpkg -l python3-neovim &> /dev/null && return 0
			;;
	esac
	echo -e "\033[1;31mError: Missing python3-neovim. Run the following command to install:\033[0m"
	case $OS in
		"arch") echo "sudo pacman -S python-pynvim" ;;
		"fedora"|"centos") echo "sudo dnf install python3-neovim" ;;
		"debian"|"ubuntu") echo "sudo apt install --no-install-recommends python3-neovim" ;;
		"msys2") echo "pacman -S mingw-w64-x86_64-python-pynvim" ;;
	esac
	return 1
}

function check_python3_setuptools() {
	case $OS in
		"arch")
			pacman -Qs python-setuptools &> /dev/null && return 0
			echo -e "\033[1;31mError: Missing python3-setuptools. Run the following command to install:\033[0m"
			echo "sudo pacman -S python-setuptools"
			return 1
			;;
	esac
	return 0
}

function check_python3_distutils() {
	case $OS in
		"arch")
			pacman -Qs python-distutils-extra &> /dev/null && return 0
			echo -e "\033[1;31mError: Missing python3-distutils. Run the following command to install:\033[0m"
			echo "sudo pacman -S python-distutils-extra"
			return 1
			;;
	esac
	return 0
}

function install_yazi(){
	local plugins=(
		"yazi-rs/plugins:smart-enter"
		"yazi-rs/plugins:git"
		"yazi-rs/plugins:toggle-pane"
		"yazi-rs/plugins:vcs-files"
	)

	mkdir -p $HOME/.config/yazi
	cp ./yazi/{init.lua,keymap.toml,yazi.toml} $HOME/.config/yazi
	for plugin in "${plugins[@]}"; do
	  if ya pack -l | grep -q "$plugin"; then
		echo "$plugin already installed"
	  else
		echo "installing $plugin"
		ya pack -a "$plugin"
	  fi
	done
}

function install_vim(){
	read -p "Choose vim version to install(null/base/easy/coc/nvim-base/nvim-easy/nvim-lsp): " version
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
		local failed=0
		check_clangd || failed=1
		check_ctags || failed=1
		check_nodejs || failed=1
		if [ $failed -ne 0 ]; then
			echo -e "\033[1;31mError: Some dependencies are missing. Please install them using the commands above.\033[0m"
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
		check_network
		mkdir -p $nvim_init_path
		cp ./nvim_easy/init.vim $nvim_init_path/init.vim
		cp -r ./nvim_easy/lua $nvim_init_path
	elif [ $version == "nvim-lsp" ]; then
		local failed=0
		check_git || failed=1
		check_curl || failed=1
		check_wget || failed=1
		check_unzip || failed=1
		check_tar || failed=1
		check_gzip || failed=1
		check_luarocks || failed=1
		check_nodejs || failed=1
		check_tree_sitter || failed=1
		check_yazi || failed=1
		check_pip || failed=1
		check_python3_neovim || failed=1
		check_python3_setuptools || failed=1
		check_python3_distutils || failed=1
		if [ $failed -ne 0 ]; then
			echo -e "\033[1;31mError: Some dependencies are missing. Please install them using the commands above.\033[0m"
			exit 2
		fi
		check_network
		mkdir -p $nvim_init_path
		cp ./nvim_lsp/init.vim $nvim_init_path/init.vim
		cp -r ./nvim_lsp/lua $nvim_init_path
		install_yazi
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
		local failed=0
		check_wget || failed=1
		check_curl || failed=1
		check_tar || failed=1
		check_jq || failed=1
		if [ $failed -ne 0 ]; then
			echo -e "\033[1;31mError: Some dependencies are missing. Please install them using the commands above.\033[0m"
			exit 2
		fi
		check_network
		cp ./zsh/zinit/zshrc.1 ~/.zshrc
		bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
		echo "" >> ~/.zshrc
		cat ./zsh/zinit/zshrc.2 >> ~/.zshrc
		cp ./zsh/zsh_aliases ~/.zsh_aliases
	elif [ $version == "manual" ]; then
		local failed=0
		check_wget || failed=1
		check_curl || failed=1
		check_tar || failed=1
		if [ $failed -ne 0 ]; then
			echo -e "\033[1;31mError: Some dependencies are missing. Please install them using the commands above.\033[0m"
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

read -p "Install which? (zsh/vim/tmux/all): " choice
case $choice in
    zsh) install_zsh ;;
    vim) install_vim ;;
    tmux) install_tmux ;;
    all) install_zsh; install_vim; install_tmux ;;
    *) echo "Invalid option"; exit 1 ;;
esac
