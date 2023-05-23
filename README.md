# 使用 stom 管理 .dotfiles 中管理的配置文件

**如果不使用stom管理**就会很麻烦，需要使用 ln 命令

粗糙解决方案：把这些 dotfiles 纳入同一个目录，ln 到正确位置。

例如：把 `.zshrc` 放在 `~/dotfile` 目录里，然后 `ln -s ~/dotfiles/.zshrc ~/.zshrc`。之后只需管理 `~/dotfiles` 这个目录。

- 软链接：`ln -s`，只会在你选定的位置上生成一个镜像，而不会占用磁盘空间。
- 硬链接：`ln`，在选定的位置上生成一个和源文件大小相同的文件，占用磁盘空间。

## 安装 stom

```sh
sudo pacman -S stom
```

## 创建 $HOME/dotfiles 文件夹

`$HOME` 是用户的家目录 `～`。

```sh
# 可以是你喜欢的任意目录，这里选择了 $HOME 木目录
mkdir $HOME/dotfiles
```

## 实例

以 `.zshrc` 为例， 创建 `zsh` 的配置文件夹/。

```sh
mkdir -p $HOME/dotfiles/zsh

# 把原来的一份备份
mv $HOME/.zshrc $HOME/dotfiles/zsh

cd $HOME/dotfiles

# 通过 stom 创建链接
stow zsh
```

**PS：** 就是这么操作流程，先建立个总目录 `~/dotfiles`，在此目录下，以软件名称（这里zsh）为单位再建目录，将已有配置迁移到该目录下，然后运行 `stow` 即可。

**注意：**
上面操作是 `dotfiles` 目录直接建立在 `$HOME` 目录下，如果不属于`$HOME` 这种父子层级。比如我的位于 ~/xxx/dotfiles，那么需要以 `stow zsh -t ~` 的方式运行。很麻烦。那么中怎么解决，运行一次，一劳永逸，再也不用加 `-t ~` 呢？

```sh
# 进入对应的 xxx 目录中的 dotfiles 下
cd ~/xxx/dotfiles
# 创建 stow 的文件夹
mkdir stow

# 在 stow 目录下，生成 .stowrc 配置文件
echo '--target=~' > stow/.stowrc

# 这是必须执行的
stow stow -t ~
```

PS：如果不管三七二十一就的前提配置好了`stow/.stowrc`文件 ，一上来就直接执`stow stow -t ~`命令，以后就执行不加 -t ~ 的参数了，比如直接 stow zsh 即可，就把 zsh 下的 .zshrc 软连接到 $HOME 目录下。
