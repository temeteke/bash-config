# 環境固有の設定を読み込む
if [ -f ~/.bash_logout.local ]; then
    source ~/.bash_logout.local
fi

# ssh-agent
case $OSTYPE in
	cygwin) ntty=$(ps | awk 'NR!=1 && $5!="?" {print $5}' | sort | uniq | wc -l) ;;
	*) ntty=$(ps | awk 'NR!=1 {print $2}' | sort | uniq | wc -l) ;;
esac

if [ $ntty -eq 1 ]; then
	eval `ssh-agent -ks`	# k:kill s:bash syntax
fi
