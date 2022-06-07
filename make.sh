#!/bin/bash
############################
# ./make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/.dotfiles
############################

# dotfiles directory
dir=~/.dotfiles

# old dotfiles backup directory
olddir=~/dotfiles_old

# list of files/folders to symlink in homedir
files="bash_profile tmux.conf vimrc vim gitconfig gitignore sqliterc flake8"

echo "source ~/.bash_profile >> ~/.bash_profile"

#move dotfiles to .dotfiles hidden folder
mv ~/dotfiles $dir

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/.$file ~/.$file
done

# check if vundle exists, if not create it
# if [ ! -d "$dir"/.vim/bundle/Vundle.vim/ ]
# then
# 	git clone https://github.com/gmarik/Vundle.vim.git ~/.dotfiles/.vim/bundle/Vundle.vim
# fi
