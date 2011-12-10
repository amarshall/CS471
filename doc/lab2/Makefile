PROJECT=	Fig4_12
# The compiler we are using is gcc 
CC=		gcc
# The Flags will print compiler warnings and will compile the code according to 
# Ansi standards. 
CFLAGS=  -std=c99 -Wall -o

# Using the -g will allow the code to be run in the debugger.
DBUGFLAGS=	-g -Wall -ansi -o Fig4_12DB.exe

# No libraries are used.
LIBS=	

# Allows us to use variables for file names.
C_SRC_FILES= \
   Fig4_12.c \
   Fig4_12R.c
   
# No header files used in this code.
H_SRC_FILES=

# Given Files for this assignment
SRC_FILES= \
  $(C_SRC_FILES) \
  $(H_SRC_FILES) \
  Makefile 
   

# Targets for compiling code

Fig4_12R:	Fig4_12R.c
		$(CC) $(CFLAGS) Fig4_12R Fig4_12R.c
Fig4_12:    Fig4_12.c
		$(CC) $(CFLAGS) Fig4_12 Fig4_12.c

#Targets for xqt
## XQTR-- (+,*) 
XQTR:   Fig4_12R  
		./Fig4_12R
		
## XQT-- (+,*) 	
XQT:  	Fig4_12
		./Fig4_12	

# Target for cleaning up XQT files 
clear:  
		rm Fig4_12?
		rm *~
		


