## Emacs
### 1. windows platform
1. 将init-emacs-windows.el文件放到C:/User/XXX/AppData/Roaming/.emacs.d/下,重命名为 init.el
2. 将上述文件中的(load "d:/temp/env-init/init.el")路径修改为emacs实际的配置文件路径
3. 启动emacs，使用M-x package-install安装插件

### 2. linux platform
1. 将init-emacs-linux.el文件放到/home/XXX/.emacs.d/下,重命名为 init.el
2. 将上述文件中的(load "~/temp/env-init/init.el")路径修改为emacs实际的配置文件路径
3. 启动emacs，使用M-x package-install安装插件


## Vim
### 1. 首先安装vim编辑器

```shell
sudo apt install vim
```

### 2. 然后安装vim插件管理工具vundle

```shell
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```

### 3. 接着将配置文件下载到本地

```shell
git clone https://github.com/sjhuangx/vimrc.git
```
将其中的.vimrc文件放到~目录
### 4. 进入vim，在命令栏输入`:BundleInstall`即可。