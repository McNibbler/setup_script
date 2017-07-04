#!/bin/bash

# A script to install stuff on new machines, by Vincent Zhao

rootpath = $(pwd)

add-apt-repository ppa:fish-shell/release-2 -y
add-apt-repository ppa:git-core/ppa -y
add-apt-repository ppa:ubuntu-mozilla-daily/ppa -y
apt-get update
apt-get install git fish vim curl tmux firefox-trunk htop screenfetch python3-pip build-essential cmake python-dev python3-dev unzip -y
apt dist-upgrade -fy
apt-get autoremove -y
git config --global user.name "Vincent Zhao"
git config --global user.email "gyroknight@users.noreply.github.com"

#Vim setup
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git ~/.vim/bundle/nerdtree-git-plugin
git clone git://github.com/jiangmiao/auto-pairs.git ~/.vim/bundle/auto-pairs
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
curl -o matchit.zip http://www.vim.org/scripts/download_script.php?src_id=8196
unzip matchit.zip
mv doc ~/.vim/
mv plugin ~/.vim/
pip install powerline-status

curl -L https://get.oh-my.fish | fish
./setup_fish.sh
