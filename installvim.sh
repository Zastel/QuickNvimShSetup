#!/usr/bin/env bash

sudo apt install neovim curl git nodejs npm -y

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

sudo npm install -g bash-language-server
sudo apt install shellcheck -y

mkdir ~/.config
mkdir ~/.config/nvim
touch ~/.config/nvim/init.vim

echo "call plug#begin()" > ~/.config/nvim/init.vim
echo "" >> ~/.config/nvim/init.vim
echo "  Plug 'neoclide/coc.nvim', {'branch': 'release'}" >> ~/.config/nvim/init.vim
echo "  Plug 'itspriddle/vim-shellcheck'" >> ~/.config/nvim/init.vim
echo "" >> ~/.config/nvim/init.vim
echo "call plug#end()" >> ~/.config/nvim/init.vim
echo "" >> ~/.config/nvim/init.vim
echo "nnoremap sh ggO#!/usr/bin/env bash<ESC>o<ESC>" >> ~/.config/nvim/init.vim
echo "nnoremap @c I# <ESC>A #<ESC>yyPlvt#r-yyjp" >> ~/.config/nvim/init.vim

mkdir ~/.config/coc
touch ~/.config/coc/coc-settings.json

echo '"languageserver": {' >> ~/.config/coc/coc-settings.json
echo '  "bash": {' >> ~/.config/coc/coc-settings.json
echo '    "command": "bash-language-server", ' >> ~/.config/coc/coc-settings.json
echo '    "args": ["start"],' >> ~/.config/coc/coc-settings.json
echo '    "filetypes": ["sh"]' >> ~/.config/coc/coc-settings.json
echo '  }' >> ~/.config/coc/coc-settings.json
echo '}' >> ~/.config/coc/coc-settings.json

