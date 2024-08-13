# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install applications
sh brew.sh

# zinit
# https://github.com/zdharma-continuum/zinit?tab=readme-ov-file#manual
sh -c "$(curl -fsSL get.zshell.dev)" -- -i skip -b main

# set up power-line shell
git clone https://github.com/banga/powerline-shell.git ~/.powerline-shell
cd ~/.powerline-shell;./install.sh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install nodenv, rbenv & ruby-build, pyenv, plenv & perl-build
# git clone https://github.com/nodenv/nodenv.git ~/.nodenv
# git clone https://github.com/nodenv/node-build.git ~/.nodenv/plugins/node-build
# git clone https://github.com/nodenv/nodenv-package-rehash.git ~/.nodenv/plugins/nodenv-package-rehash
# git clone https://github.com/nodenv/node-build-update-defs.git ~/.nodenv/plugins/node-build-update-defs
# git clone https://github.com/rbenv/rbenv.git ~/.rbenv
# git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
# git clone https://github.com/pyenv/pyenv.git ~/.pyenv
# git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
# git clone https://github.com/tokuhirom/plenv.git ~/.plenv
# git clone https://github.com/tokuhirom/Perl-Build.git ~/.plenv/plugins/perl-build

# asdf
# The Multiple Runtime Version Manager
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0

# symlinks
ln -sf ~/Workspaces/dotfiles/.zshrc ~/.zshrc
# ln -sf ~/Workspaces/dotfiles/.zshrc.antigen ~/.zshrc.antigen
ln -sf ~/Workspaces/dotfiles/.zshrc.zinit ~/.zshrc.zinit
ln -sf ~/Workspaces/dotfiles/.zshrc.oh-my-zsh ~/.zshrc.oh-my-zsh
ln -sf ~/Workspaces/dotfiles/.zprofile ~/.zprofile
ln -sf ~/Workspaces/dotfiles/.exports ~/.exports
ln -sf ~/Workspaces/dotfiles/.aliases ~/.aliases
ln -sf ~/Workspaces/dotfiles/.functions ~/.functions
ln -sf ~/Workspaces/dotfiles/.gemrc ~/.gemrc
ln -sf ~/Workspaces/dotfiles/.vimrc ~/.vimrc
ln -sf ~/Workspaces/dotfiles/.vimrc.basic ~/.vimrc.basic
ln -sf ~/Workspaces/dotfiles/.vimrc.editor ~/.vimrc.editor
ln -sf ~/Workspaces/dotfiles/.vimrc.encoding ~/.vimrc.encoding
ln -sf ~/Workspaces/dotfiles/.vimrc.plugins ~/.vimrc.plugins
ln -sf ~/Workspaces/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/Workspaces/dotfiles/.editorconfig ~/.editorconfig
ln -sf ~/Workspaces/dotfiles/.tmux.conf ~/.tmux.conf

