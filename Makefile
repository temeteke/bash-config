PREFIX := ~
FILES := .bashrc .bash_profile .bash_logout .inputrc

.PHONY: all clean install uninstall FORCE
all: .bashrc

BASHRCS := .bashrc.misc .bashrc.color .bashrc.history .bashrc.alias
ifneq ($(shell which git 2>/dev/null),)
	BASHRCS := $(BASHRCS) .bashrc.git
endif
ifneq ($(shell which tmux 2>/dev/null),)
	BASHRCS := $(BASHRCS) .bashrc.tmux
endif
ifneq ($(shell which direnv 2>/dev/null),)
	BASHRCS := $(BASHRCS) .bashrc.direnv
endif
ifneq ($(shell which fzf 2>/dev/null),)
	BASHRCS := $(BASHRCS) .bashrc.fzf
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

clean:
	rm -f .bashrc

install: $(FILES)
	cp $(FILES) $(PREFIX)/

uninstall:
	rm $(addprefix $(PREFIX)/, $(FILES))

FORCE:
