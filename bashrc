if which git > /dev/null 2>&1; then
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
	# Arch Linux
	if [ -f /usr/share/git/completion/git-completion.bash ]; then
		source /usr/share/git/completion/git-completion.bash
	fi
	if [ -f /usr/share/git/completion/git-prompt.sh ]; then
		source /usr/share/git/completion/git-prompt.sh
	fi
	GIT_PS1_SHOWDIRTYSTATE=true
fi

# プロンプト
# via http://d.hatena.ne.jp/notogawa/20120720/1342756620
if type __git_ps1 > /dev/null 2>&1; then
	PS1_GIT='\[\033[0;31m\]$(__git_ps1)'
else
	PS1_GIT=''
fi
PS1_LEFT="\[\033[1;33m\]\u@\h \[\033[0;34m\]\w$PS1_GIT"
PS1_RIGHT="\[\033[0;36m\][`date '+%F %T'`]"
PS1_2="\[\033[1;37m\]\$ "
export PS1="$PS1_LEFT\[\033[$[COLUMNS]D\]\[\033[$[COLUMNS-21]C\]$PS1_RIGHT\n$PS1_2\[\033[0m\]"

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
