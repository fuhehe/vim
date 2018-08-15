CentOS 6升级 gcc

1.下载 repo 到本地  
wget http://people.centos.org/tru/devtools-2/devtools-2.repo -O /etc/yum.repos.d/devtools-2.repo

2.安装  
yum install devtoolset-2-gcc devtoolset-2-binutils devtoolset-2-gcc-c++

3.创建链接  
ln -s /opt/rh/devtoolset-2/root/usr/bin/* /usr/local/bin/

4.设置优先级  
update-alternatives --install /usr/bin/gcc gcc /usr/local/bin/gcc 100  
update-alternatives --install /usr/bin/g++ g++ /usr/local/bin/g++ 100  

5.或者用下面的方法启用  
echo 'source /opt/rh/devtoolset-2/enable' >> /etc/profile 
source /opt/rh/devtoolset-2/enable


安装 vim 需要的 lua ruby python perl  
yum install lua lua-devel  
yum install ruby ruby-devel  
yum install perl perl-devel perl-core  


升级python  

1：安装devtoolset  
yum groupinstall "Development tools"  

2：安装编译Python需要的包  
yum install zlib-devel  
yum install bzip2-devel  
yum install openssl-devel  
yum install ncurses-devel  
yum install sqlite-devel  

3：下载并解压Python 2.7 的源代码  
cd /opt  
wget --no-check-certificate https://www.python.org/ftp/python/2.7.9/Python-2.7.15.tar.xz  
tar xf Python-2.7.15.tar.xz  
cd Python-2.7.15  

4：编译与安装Python 2.7  
./configure --prefix=/usr/local --enable-shared CFLAGS=-fPIC  
make && make altinstall  
ldconfig  

5：更改系统默认的python  
mv /usr/bin/python  /usr/bin/python.bak  
ln -s /usr/local/bin/python2.7 /usr/bin/python  

6：保持yum可用性  
vim /usr/bin/yum  
#!/usr/bin/python 改为 #!/usr/bin/python2.6  

7：安装pip  
curl -O https://bootstrap.pypa.io/get-pip.py # 得到一个get-pip.py  
python get-pip.py


安装 vim 所需的 perl
yum install perl perl-devel perl-ExtUtils-ParseXS perl-ExtUtils-XSpp perl-ExtUtils-CBuilder perl-ExtUtils-Embed


升级 vim

1：安装 vim:  
git clone https://github.com/vim/vim.git  
cd vim  
./configure --with-features=huge --enable-rubyinterp --enable-pythoninterp --with-python-config-dir=/usr/local/lib/python2.7/config --enable-python3interp --enable-luainterp --enable-perlinterp --enable-multibyte --enable-cscope  
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
