#!/usr/bin/env ruby
# ^^ This is the "shebang" and tells the shell to run the file through that command.
#    Using /usr/bin/env can be preferred as it will respect the PATH.
#    The file must be made executable by running `chmod +x filename`.

# CS 471 Lab 1
# @author J. Andrew Marshall <jmarsha6@binghamton.edu>

def power(base, pow)
  (1..pow).inject(1) { |result, o| result *= base; }
end

puts power(2, 8)
