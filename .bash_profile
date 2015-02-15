# 環境固有の設定を読みむ
if [ -f ~/.bash_profile.local ]; then
	source ~/.bash_profile.local
fi

# 環境変数の設定
export PATH=~/bin.local:~/bin:~/setman:$PATH

# umask
umask 027

# .bashrcを読み込む
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi
