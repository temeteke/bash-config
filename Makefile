PREFIX := ~
FILES := .bashrc .bash_profile .bash_logout .inputrc

.PHONY: all clean install uninstall FORCE
all: .bashrc

.bashrc: .bashrc.color .bashrc.misc .bashrc.prompt
	cat $^ > $@

clean:
	rm .bashrc

install: $(FILES)
	cp $(FILES) $(PREFIX)/
		
uninstall:
	rm $(addprefix $(PREFIX)/, $(FILES))

FORCE:
