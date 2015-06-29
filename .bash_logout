# 環境固有の設定を読み込む
if [ -f ~/.bash_logout.local ]; then
    source ~/.bash_logout.local
fi

# ssh-agent
fieldIndex=2
[ $OSTYPE = "cygwin" ] && fieldIndex=5
if [ $(ps | awk 'NR != 1 && $'$fieldIndex' ~ /tty|pts|pty/ {print $'$fieldIndex'}' | sort | uniq | wc -l) -eq 1 ]; then
	eval `ssh-agent -ks`	# k:kill s:bash syntax
fi
