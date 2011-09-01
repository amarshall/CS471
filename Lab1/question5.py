#!/usr/bin/env python
# ^^ This is the "shebang" and tells the shell to run the file through that command.
#    Using /usr/bin/env can be preferred as it will respect the PATH.
#    The file must be made executable by running `chmod +x filename`.

# CS 471 Lab 1
# @author J. Andrew Marshall <jmarsha6@binghamton.edu>

def power(base, pow):
  result = 1
  for i in range (0, pow):
    result *= base
  return result

print power(2, 8)
