# 環境固有の設定を読み込む
if [ -f ~/.bash_profile.local ]; then
	. ~/.bash_profile.local
fi

# 環境変数の設定
export PATH=~/bin:$PATH

# .bashrcを読み込む
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# bash起動時に起動する物
if [ -z "$TMUX" ]; then
	if [ -z "$SSH_AUTH_SOCK" ]; then
		eval $(ssh-agent)
	fi

	# WSLならtmuxを起動しない
	if [ -z "$WSL_DISTRO_NAME" ] && tty > /dev/null && which tmux > /dev/null 2>&1; then
		if [ -z "$(tmux ls)" ] ; then
			tmux
		else
			tmux attach
		fi
	fi
fi
