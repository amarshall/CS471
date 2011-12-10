#!/usr/bin/python

# Just open this file in IDLE.
# Select "Run Module" or press F5 control key
# You will open another window, Python Shell and it will display:
#  >>> ================================ RESTART ==========================
#  >>> 
#  >>>
# At the prompt, >>>, you can execute the functions
#  e.g.
#   >>> factr(5)
#   120

#This works for both Python 2.6 and 3.1

#Imperative style using for loop like the "C" example
def factf (n):
    acc = 1
    for i in range (1,n+1):    # i assumes the values 2 to n
        acc = i * acc
    return acc

# end of factf

# Functional style
def factr (n):
    if n == 0:
        return 1
    else :
        return n * factr(n-1)
    
# end of factr

#Imperative style using "while loop"

def factw (n):
    acc = 1
    while n > 0 :
        acc = n * acc
        n = n - 1
    return acc

#Another Functional style

def fact(n) :
    return factfw(n,1)

def factfw (n,acc) :
    if n > 0 :
        return factrw(n-1, n*acc)
    else:
        return acc

    
    
