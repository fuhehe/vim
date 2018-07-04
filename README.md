# vim

vim config


1：安装 vim:

git clone https://github.com/vim/vim.git

cd vim

./configure --with-features=huge --enable-rubyinterp --enable-pythoninterp --enable-python3interp --enable-luainterp --enable-perlinterp --enable-multibyte --enable-cscope

make & make install


2：拷贝 vim 配置文件

git clone https://github.com/fuhehe/vim.git

ln -s ./fuhehe/.vimrc .vimrc


3：安装 vim-plug

mkdir ~/.vim/autoload/

cd ~/.vim/autoload/

wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


4：通过 vim-plug 配置插件

vim ~/.vimrc

:PlugInstall

cd .vim/plugged/YouCompleteMe

git submodule update --init --recursive

./install.py



备注：

vim-plug 介绍：

直接下载到指定目录即可

mkdir ~/.vim/autoload/

cd ~/.vim/autoload/

wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

配置vim plug

vim ~/.vimrc

将要安装的插件写入~/.vimrc，这里以ycm插件为例：
 
call plug#begin('~/.vim/plugged')  

以安装ycm插件为例：

Plug 'Valloric/YouCompleteMe'  

call plug#end()  

vim ~/.vimrc

切换到命令行模式，依次输入

:PlugStatus

:PlugInstall

就可以安装插件了


使用vim plug可以方便的管理插件

查看插件类型：

:PlugStatus

安装插件：

:PlugInstall

更新插件：

:PlugUpdate

vim-plug本身更新：

:PlugUpgrade
