PREFIX := ~
FILES := .bashrc .bash_profile .bash_logout .inputrc

.PHONY: all clean install uninstall FORCE
all: .bashrc

BASHRCS := .bashrc.misc .bashrc.color .bashrc.history .bashrc.fzf shell-config/alias.sh
ifneq ($(shell which git 2>/dev/null),)
	BASHRCS := $(BASHRCS) .bashrc.git
endif
ifneq ($(shell which tmux 2>/dev/null),)
	BASHRCS := $(BASHRCS) .bashrc.tmux
endif
ifneq ($(shell which direnv 2>/dev/null),)
	BASHRCS := $(BASHRCS) .bashrc.direnv
endif
ifneq ($(shell which kubectl 2>/dev/null),)
	BASHRCS := $(BASHRCS) .bashrc.kubernetes
endif
ifneq ($(shell which starship 2>/dev/null),)
	BASHRCS := $(BASHRCS) .bashrc.starship
endif
BASHRCS := $(BASHRCS) .bashrc.prompt .bashrc.local

# コマンドをインストールした後に$(BASHRCS)が変化するため毎回生成する
.bashrc: $(BASHRCS) FORCE
	cat $(BASHRCS) > $@

shell-config/alias.sh: shell-config

shell-config: FORCE
	git clone --depth 1 https://github.com/temeteke/shell-config.git $@ 2> /dev/null || git -C $@ pull

clean:
	rm -f .bashrc
	rm -fr shell-config

install: $(FILES)
	cp -a $(FILES) $(PREFIX)/

uninstall:
	rm -f $(addprefix $(PREFIX)/, $(FILES))

FORCE:
