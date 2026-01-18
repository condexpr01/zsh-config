> My tmux, zsh config backup

# zsh config

* zshenv
> 主要配置`XDG_CONFIG_HOME`,`XDG_CACHE_HOME`,`XDG_DATA_HOME`,`XDG_STATE_HOME`,    
> 以及设置默认编辑器和一些环境变量

* zshrc
> 开启补全,开启vi键位模式,模仿vi光标


# tmux config
> 模仿vi键位

```txt
	prefix:  <Ctrl-b>

	panes:   split: s / v move: h j k l exit:  q
	windows: close: c     new: n / w    select: 0-9
```

# theme
> p10k: [romkatv/powerlevel10k.git](https://github.com/romkatv/powerlevel10k.git)


# install

```shell
makepkg -si
```


