#defining variables 
CC=gcc
INCDIRS=-I.
#optimization flag
OPT=-O0
CFLAGS=-Wall -Wextra -g $(INCDIRS) $(OPT)

CFILES=x.c y.c
OBJECTS=x.o y.o

BINARY=bin

#build rules
	#starts with colon delimeted separation of the target that is
	#going to be built
	#and the dependencies that it has

#all makefiles have the all rule, that will allow us to type make all
#and it will build everything in the system
#if i want to build everything then the binary must be prepared

all: $(BINARY)

#there is a binary, that here is bin, the executable
#it depends on all of the .o file being properly generated
#for this rule to be executed i absolutely need all the .o files
#to have been properly created within the system
#After all objects are created then the dependencies for this rule are satisfied
#and then binary can be generated
#this says; run gcc and the output of running gcc should be what is on the left
#hand side of the colon(the name of the binary "bin") and it should take as arguments
#what is on the right hand side 
$(BINARY): $(OBJECTS)
	$(CC) -o $@ $^
#the rules for the creation of the .o's
#here we have wildcards, regular expressions, where the % is a wildcard(can be nanything)
#it says, if you want to build any text.o, then that depends
#on that same text .c
#this is a generic rule that applies to every single .c file that will
#build a .o file
#what is says is run gcc with the flags
#$@ says, whatever is on left hand side of the colon, whatever is there, copy
#and paste it here
#$^ says take whatever is on the right hand side of the colon and paste it ther
%.o:%.c
	$(CC) $(CFLAGS) -c -o $@ $^

#also is convention to provide a clean
#that will clean all the built artifacts
clean:
	rm -rf $(OBJECTS)

fclean: clean
	rm -rf $(BINARY)

re: fclean all
