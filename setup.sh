#!/bin/bash

# A script to install stuff on new machines, for Thomas Kaunzinger cloned from Vincent Zhao

rootpath=$(pwd)

sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-get update
sudo apt-get install git zsh vim curl tmux htop screenfetch python3-pip build-essential cmake python-dev python3-dev unzip -y
sudo apt dist-upgrade -fy
sudo apt-get autoremove -y
pip3 install --upgrade pip
git config --global user.name "McNibbler"
git config --global user.email "McNibbler@users.noreply.github.com"
cp tmux.conf ~/.tmux.conf

#Vim setup
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git ~/.vim/bundle/nerdtree-git-plugin
git clone git://github.com/jiangmiao/auto-pairs.git ~/.vim/bundle/auto-pairs
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.py --clang-completer
cd $rootpath
curl -o matchit.zip http://www.vim.org/scripts/download_script.php?src_id=8196
unzip matchit.zip
mv doc ~/.vim/
mv plugin ~/.vim/
sudo pip3 install powerline-status
cp vimrc ~/.vimrc 
mkdir -p ~/.vim/.undo ~/.vim/.backup ~/.vim/.swp

#Cleanup
cd $rootpath
rm matchit.zip

