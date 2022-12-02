BINARY=bin
CODEDIRS=. lib
INCDIRS=. ./include/
OBJ_PATH = ./objs/

CC=gcc
OPT=-O0
#generate file that encode make rules for the .h dependencies
DEPFLAGS=-MP -MD
#automatically add the -I onto each include directory 
CFLAGS=-Wall -Wextra -g $(foreach D, $(INCDIRS), -I$(D)) $(OPT) $(DEPFLAGS)

#for-style iteration (foreach) and regular expression completions (wildcard)
CFILES=$(foreach D,$(CODEDIRS),$(wildcard $(D)/*.c))
#regular expression replacement
#OBJECTS=$(patsubst %.c, %.o, $(CFILES))
OBJECTS=$(patsubst %, $(OBJ_PATH)%.o, $(basename $(notdir $(CFILES))))
DEPFILES=$(patsubst %.c, %.d, $(CFILES))

### COLORS ###
NOC         = \033[0m
BOLD        = \033[1m
UNDERLINE   = \033[4m
BLACK       = \033[1;30m
RED         = \033[1;31m
GREEN       = \033[1;32m
YELLOW      = \033[1;33m
BLUE        = \033[1;34m
VIOLET      = \033[1;35m
CYAN        = \033[1;36m
WHITE       = \033[1;37m


### RULES ###

all: $(BINARY)

$(BINARY): $(OBJECTS)
	$(CC) -o $@ $^
	@echo "$(VIOLET)Project compiled succesfully"

$(OBJ_PATH):
	@mkdir -p $(OBJ_PATH)
	@echo "Creating the folder for objects"
#only wan the .c file dependency here, thus $< instead of $^

#%.o:%.c
$(OBJECTS): $(OBJ_PATH)%.o: %.c | $(OBJ_PATH)
	$(CC) $(CFLAGS) -c -o $@ $<
	@echo "$(BLUE) Creation of new object files"

clean:
	rm -rf $(OBJ_PATH) $(DEPFILES)

fclean: clean
	rm -rf $(BINARY)

#shell commands are set of keystrokes away
distribute: clean
	tar zcvf dist.tgz *

#@ silences the printing of the command 
# $(info..) prints output

diff:
	$(info the status of the repository, and the volume of per-file changes:)
	@git status
	@git diff --stat
	
#include the dependencies
-include $(DEPFILES)

re: fclean all

#add .PHONY so that non-targetfile -rules work even if a file with the same name exists.
.PHONY: all fclean clean distribute diff
