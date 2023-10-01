#!/bin/zsh

pushd $(pwd)

script_dir=$(cd $(dirname $0); pwd)

# backup the neovim configure if exists
timestamp=$(date +'%F,%H:%M')
test -d ~/.config/nvim && mv ~/.config/nvim ~/.config/nvim.backup.$timestamp

# copy to destination
mkdir -p ~/.config/nvim
cp $script_dir/init.lua $script_dir/lua ~/.config/nvim -rf

echo 'done!'

popd

