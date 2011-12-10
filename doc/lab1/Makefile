PROJECT=	lab1
# The compiler we are using is gcc 
CC=		gcc
# The Flags will print compiler warnings and will compile the code according to 
# Ansi standards. 
CFLAGS= 	-ansi -Wall -o lab1p1.exe

# Using the -g will allow the code to be run in the debugger.
DBUGFLAGS=	-g -Wall -std=c99 -o lab1DB.exe

# No libraries are used.
# Example for libs:   -L$$HOME/cs452/projects/prj5/lib -lcs452
LIBS=	

# Allows us to use variables for file names.
C_SRC_FILES= \
   lab1_1.c \
   lab1Driver.c
# No header files used in this code.
H_SRC_FILES= \
	lab1_1.h

# Files for this assignment
SRC_FILES= \
  $(C_SRC_FILES) \
  $(H_SRC_FILES) \
  Makefile \
  README 
# Intermediate files
O_FILES= \
   lab1_1.o \
	lab1Driver.o

# Target for creating an executable file:
lab1p1:		$(C_SRC_FILES) $(H_SRC_FILES)
		$(CC) -o lab1p1 -std=c99 $(C_SRC_FILES)

# Target for executing the program in problem 1.
runIt:  	lab1p1
		./lab1p1
		
# Builds the intermedate assembly file for lab1_1EH.c Use for problem 7

lab1p2ASM:  	lab1_1EH.c
		$(CC)  -Wall lab1_1EH.c -S -std=c99 -o lab1p2.s

lab1p2ASM32:  	lab1_1EH.c
		$(CC)  -Wall lab1_1EH.c -S -m32 -std=c99 -o lab1p2_32.s
		
#command for compiling code and running debugger.		
lab1DB:	$(C_SRC_FILES) $(H_SRC_FILES)
	$(CC) $(DBUGFLAGS) -o lab1p1 -std=c99 -m32 $(C_SRC_FILES)
	gdb lab1p1
	
# Target for cleaning up files 
clear:  
		rm lab1p1
		rm lab1*.o
		rm lab1*.s
