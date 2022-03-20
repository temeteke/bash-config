# 色
alias ls='ls -v --color=auto --time-style=long-iso'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias less='less -R'

# 安全のため
alias crontab='crontab -i'

# 打ち間違いに対応
alias l=ls
alias sl=ls

# sudo
# https://yudoufu.hatenablog.jp/entry/20110326/1301129885
alias sudo='sudo -E '

# Windows character encoding convert
# http://myfuturesightforpast.blogspot.jp/2015/10/cygwinmsys2windows.html
if [ "$OS" = "Windows_NT" ]; then
	wincmd(){
		CMD=$1
		shift
		$CMD $* 2>&1 | iconv -f cp932 -t utf-8
	}

	alias ipconfig='wincmd ipconfig'
	alias ping='wincmd ping'
	alias arp='wincmd arp'
	alias nslookup='wincmd nslookup'
	alias netstat='wincmd netstat'
	alias tracert='wincmd tracert'
	alias netsh='wincmd netsh'
	alias taskkill='wincmd taskkill'
	alias cs='wincmd cscript.exe -NoLogo'
	alias ws='wincmd wscript.exe -NoLogo'
fi

if type winpty > /dev/null 2>&1; then
	alias docker='winpty docker'
fi
