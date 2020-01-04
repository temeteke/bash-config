PREFIX := ~
FILES := .bashrc .bash_profile .bash_logout .inputrc

.PHONY: all clean install uninstall FORCE
all: .bashrc

BASHRCS := .bashrc.color .bashrc.misc .bashrc.prompt .bashrc.tmux .bashrc.history .bashrc.local
ifneq ($(shell which direnv 2>/dev/null),)
	BASHRCS := $(BASHRCS) .bashrc.direnv
endif
ifneq ($(shell which fzf 2>/dev/null),)
	BASHRCS := $(BASHRCS) .bashrc.fzf
endif

.bashrc: $(BASHRCS)
	cat $^ > $@

clean:
	rm -f .bashrc

install: $(FILES)
	cp $(FILES) $(PREFIX)/
		
uninstall:
	rm $(addprefix $(PREFIX)/, $(FILES))

FORCE:
