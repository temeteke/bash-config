PREFIX := ~
FILES := .bashrc .bash_profile .bash_logout .inputrc

.PHONY: all clean install uninstall FORCE
all:

clean:

install:
	cp $(FILES) $(PREFIX)/
		
uninstall:
	rm $(addprefix $(PREFIX)/, $(FILES))

FORCE:
