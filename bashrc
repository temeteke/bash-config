if which git > /dev/null 2>&1; then
	# Gitのブランチを表示 TODO:ここ必要か?
	# Mac
	if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
		source /usr/local/etc/bash_completion.d/git-prompt.sh
	fi
	if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
		source /usr/local/etc/bash_completion.d/git-completion.bash
	fi
	# Ubuntu
	if [ -f /etc/bash_completion.d/git-prompt ]; then
		source /etc/bash_completion.d/git-prompt
	fi
	if [ -f /etc/bash_completion.d/git ]; then
		source /etc/bash_completion.d/git
	fi
	# FreeBSD
	if [ -f /usr/local/share/git-core/contrib/completion/git-prompt.sh ]; then
		source /usr/local/share/git-core/contrib/completion/git-prompt.sh
	fi
	if [ -f /usr/local/share/git-core/contrib/completion/git-completion.bash ]; then
		source /usr/local/share/git-core/contrib/completion/git-completion.bash
	fi
	# Fedora
	if [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
		source /usr/share/git-core/contrib/completion/git-prompt.sh
	fi
	GIT_PS1_SHOWDIRTYSTATE=true
fi

# プロンプト
if which git > /dev/null 2>&1; then
	export PS1='\[\033[33m\]\u@\h \[\033[36m\]\t \[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\$ '
else
	export PS1='\[\033[33m\]\u@\h \[\033[36m\]\t \[\033[34m\]\w\[\033[00m\]\n\$ '
fi

export CLICOLOR=1

# カラーの設定
if [ $OSTYPE = "linux-gnu" ]; then
	# enable color support of ls and also add handy aliases
	if [ -x /usr/bin/dircolors ]; then
	    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	    alias ls='ls --color=auto'
	    #alias dir='dir --color=auto'
	    #alias vdir='vdir --color=auto'

		alias grep='grep --color=auto'
	    alias fgrep='fgrep --color=auto'
	    alias egrep='egrep --color=auto'
	fi
fi

# コマンドのエイリアス
alias vi=vim
alias sl=ls
alias l=ls

# Cygwinの文字化け対策
# via http://orumin.blogspot.jp/2012/05/cygwin-linuxwindows-gccvimusb.html
if [ $OSTYPE = "cygwin" ]; then
	alias ifconfig="cocot ipconfig"
	alias ping="cocot ping"
	alias arp="cocot arp"
	alias nslookup="cocot nslookup"
	alias traceroute="cocot tracert"
	alias route="cocot route"
	alias netstat="cocot netstat" 
fi

# エディタの設定
export EDITOR=vim
export SVN_EDITOR=vi

# 環境固有の設定を読み込む
if [ -f ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi

# 日本語の設定
case $TERM in
	linux) export LANG=C ;;
	*) export LANG=ja_JP.UTF-8 ;;
esac

# Ctrl-s,Ctrl-qがVimとかでつかえるようにする
# via http://d.hatena.ne.jp/ksmemo/20110214/p1
# via http://www.akamoz.jp/you/uni/shellscript.htm
if [ -t 0 ]; then
	stty -ixon -ixoff
fi
