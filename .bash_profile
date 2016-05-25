# 環境固有の設定を読みむ
if [ -f ~/.bash_profile.local ]; then
	. ~/.bash_profile.local
fi

# 環境変数の設定
export PATH=~/bin:$PATH

# .bashrcを読み込む
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
