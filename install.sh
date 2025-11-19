
config_path=$(dirname "$(readlink -f "$0")")

# 使环境跟随后再设置
source "$config_path"/zshenv

sudo cp -fv "$config_path"/zshenv /etc/zsh/
cp -fv "$config_path"/tmux.conf "$XDG_CONFIG_HOME"/tmux/
cp -fv "$config_path"/.zshrc "$XDG_CONFIG_HOME"/zsh/
cp -fv "$config_path"/.p10k.zsh "$XDG_CONFIG_HOME"/zsh/

# glone p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$XDG_CONFIG_HOME"/zsh/powerlevel10k
