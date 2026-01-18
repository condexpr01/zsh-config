
#tmux要在p10k-instant-prompt前
if [ -z "$TMUX" ];then
	# tmux(有启动就连上session，没有就建立session)
	tmux attach -t session || tmux new -s session
fi


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# powerlevel10k
source "$XDG_CONFIG_HOME"/zsh/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh



# 补全初始化并启动(模糊大小写和连字符)
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'm:{-_}={_-}'
if [ -n "$XDG_CACHE_HOME" ] ;then
	# 补全的缓存位置
	compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
fi



#zsh notification
#禁用所有 Zsh 内置提示音
unsetopt BEEP           # 通用提示音
unsetopt HIST_BEEP      # 历史记录错误提示音
unsetopt LIST_BEEP      # 补全列表提示音


cursor_shape_insert() { printf '\e[6 q' }     # 竖线
cursor_reset_color()  { printf '\e]17;\e\\' } # 重置颜色
cursor_shape_cmd()    { printf '\e[2 q' }     # 方块

# 光标钩子有事件时,刷新防篡改
autoload -Uz add-zsh-hook
add-zsh-hook precmd cursor_shape_insert
add-zsh-hook precmd cursor_reset_color

# 模式检测组件
zle-keymap-select() {
  case $KEYMAP in
    vicmd)cursor_shape_cmd    ;; #命令模式
    main) cursor_shape_insert ;; #主模式
    *)    cursor_shape_insert ;; #其它所有
  esac}
zle -N zle-keymap-select

# 选择模式时的高亮
zle_highlight=(region:bg=#39c5bb,fg=#ffffff)


#zsh bindkey vi mode
bindkey -v '^?' backward-delete-char #backspace repair


# alias
alias man="man --pager=\"nvim +Man! -\""
alias ls="ls --block-size=M --color --all"
alias du="du --block-size=M --max-depth=1 -h"
alias df="df --block-size=M -h"

alias adb='HOME="$XDG_DATA_HOME"/android adb'
alias wget="wget --hsts-file=$XDG_DATA_HOME/wget-hsts"


# nvidia-settings的设置目录
alias nvidia-settings="nvidia-settings --config=${XDG_CONFIG_HOME}/nvidia/settings"

# neovim
function vi(){nvim-qt --fullscreen "$@"}
function nv(){nvim-qt --fullscreen "$@"}
function vim(){nvim-qt --fullscreen "$@"}

function tmux-help() {

	local R="\e[31m"        # Red
	local G="\e[32m"        # Green
	local Y="\e[33m"        # Yellow
	local B="\e[34m"        # Blue
	local M="\e[35m"        # Magenta
	local C="\e[36m"        # Cyan
	local W="\e[37m"        # White / Light Gray

	local BOLD="\e[1m"      # Bold
	local DIM="\e[2m"       # Dim / Faint
	local RESET="\e[0m"     # Reset formatting

	echo -e "
	${BOLD}${B}> tmux help: ${RESET}
	${DIM}---------------------------------------${RESET}

	${G}prefix:${RESET}  ${BOLD}<Ctrl-b>${RESET}

	${G}panes:${RESET}   split: ${BOLD}s / v${RESET} move: ${BOLD}h j k l${RESET} exit: ${BOLD} q${RESET}
	${G}windows:${RESET} close: ${BOLD}c${RESET}     new: ${BOLD}n / w${RESET}    select: ${BOLD}0-9${RESET}
	${G}session:${RESET} :attach / :detach / :switch-client
	${G}command:${RESET} tmux ${BOLD}list-commands${RESET}

	${DIM}---------------------------------------${RESET}"
}











