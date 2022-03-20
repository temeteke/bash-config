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

# ssh-agent
if [ -z "$SSH_AUTH_SOCK" ]; then
	export SSH_AUTH_SOCK=$HOME/.ssh/agent.sock

	# Windowsの場合、Windowsのssh-agentを使う
	if type npiperelay.exe > /dev/null 2>&1; then
		if ! pgrep -f 'npiperelay.exe -ei -s //./pipe/openssh-ssh-agent' > /dev/null; then
			rm -f $SSH_AUTH_SOCK
			( setsid socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:"npiperelay.exe -ei -s //./pipe/openssh-ssh-agent",nofork & ) >/dev/null 2>&1
		fi
	else
		# ssh-agentを起動する
		# $SSH_AUTH_SOCKがなければ作成する
		if [ ! -S "$SSH_AUTH_SOCK" ]; then
			eval $(ssh-agent -a $SSH_AUTH_SOCK)
			echo $SSH_AGENT_PID > $HOME/.ssh/agent.pid
		fi

		# PIDを復元する
		if [ -z "$SSH_AGENT_PID" ]; then
			export SSH_AGENT_PID=$(cat $HOME/.ssh/agent.pid)
		fi
	fi
fi

# tmuxを自動起動（WSL以外）
if [ -z "$WSL_DISTRO_NAME" ] && [ -z "$TMUX" ] && tty > /dev/null && which tmux > /dev/null 2>&1; then
	if [ -z "$(tmux ls)" ]; then
		tmux
	else
		tmux attach
	fi
fi
