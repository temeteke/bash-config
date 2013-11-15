# 環境固有の設定を読みむ
if [ -f ~/.bash_profile.local ]; then
	source ~/.bash_profile.local
fi

# 環境変数の設定
export PATH=~/bin:~/bin.local:$PATH

# tmux and ssh-agent
# via http://robinwinslow.co.uk/2012/07/20/tmux-and-ssh-auto-login-with-ssh-agent-finally.html
if [ -z "$TMUX" ]; then
	# we're not in a tmux session


	# if ssh auth variable is missing
	if [ -z "$SSH_AUTH_SOCK" ]; then
		export SSH_AUTH_SOCK="$HOME/.ssh/.auth_socket"
	fi

	# if socket is available create the new auth session
	if [ ! -S "$SSH_AUTH_SOCK" ]; then
		eval `ssh-agent -s -a $SSH_AUTH_SOCK`	# s:bash syntax
		echo $SSH_AGENT_PID > $HOME/.ssh/.auth_pid
	fi

	# if agent isn't defined, recreate it from pid file
	if [ -z $SSH_AGENT_PID ]; then
		export SSH_AGENT_PID=`cat $HOME/.ssh/.auth_pid`
	fi

	# Add all default keys to ssh auth
	#ssh-add 2>/dev/null

	# start tmux
	# via http://www.omakase.org/misc/tmux_screen.html
	if [ -z `tmux ls` ] ; then
		tmux
	else
		tmux attach
	fi
fi

# .bashrcを読み込む
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi
