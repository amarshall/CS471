# CS 471 Lab 1
# @author J. Andrew Marshall <jmarsha6@binghamton.edu>

all: question1 question2 question3

CC=gcc -Wall -std=c99

question1: question1.c
	$(CC) question1.c

question2: question2.c
	$(CC) question2.c -S -o question2.s

question3: question3-main.c question3.c question3.h
	$(CC) question3-main.c question3.c -o question3

clean:
	rm -rf *.o *.s question1 question2 question3

lab1R: question3
	./question3
