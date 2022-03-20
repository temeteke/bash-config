# 環境固有の設定を読み込む
if [ -f ~/.bash_logout.local ]; then
    source ~/.bash_logout.local
fi

# ssh-agentが起動していてtmux以外でbashを終了した場合はssh-agentを終了する
if [ -n "$SSH_AGENT_PID" -a -z "$TMUX" ]; then
	ssh-agent -k
	rm -f $HOME/.ssh/agent.pid
fi
