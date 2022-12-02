#!/bin/sh

#generate the x.o file
gcc -Wall -Wextra -I. -g -c x.c
#generate the y.o file
gcc -Wall -Wextra -I. -g -c y.c
#creates the binary 
gcc y.o x.o -o bin

#Problems with this implementation:
	#even if only one file has been changed it recompiles everything, that
	#is not a problem in this case
	#but in the case of a project with many files it would slow down
	#everything
	
	#It has a lot of redundant/duplicate code
	#If optimization flags are added they need to be added to all
	#lines that need them, and that is prone to giving errors
