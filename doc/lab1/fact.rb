#!/usr/bin/ruby
# Module example in RUBY 
#          -- makes a name space
#          -- can be used in Mix-ins
# Ruby is object oriented so we need to include the module

# To run using

#      IRB::
# ...> load 'fib.rb'
# 40320
# 40320
# 40320
# 40320
# 40320
#      ==> true
# ...> factr(3)
# ==> 6

# To run using SciTE
# open text file in SciTE 
# To check syntax -- pull down "Tools" menu and select "Check Syntax"
# To execute code -- pull down "Tools" menu and select "Go" 
#    You will see in the frame on the right::
#        >ruby fact.rb
#        40320
#        40320
#        40320
#        40320
#        40320
#        >Exit code: 0
#    There is no interactive testing permitted in this frame.

module Fact

 #Imperative style using for loop like the "C" example

    def factf (n)
        acc = 1
        for i in 1 .. n    # i assumes the values 1 to n
            acc = i * acc
        end #End of for
        return acc
    end #End of factf

 # Imperative style using do/end block
 
    def factb(n)
      acc = 1
      n.times do  |i| # everything is an object, even n,  variable i values changes from 0 to n-1
         acc = acc * (i+1) 
      end  # so n.times causes the do block to be executed n times.
      return acc
    end  # so n.times causes the do block to be executed n times.

 

 # Functional style
 
    def factr (n)
      if n== 0 then
         return 1 
      else
         return  n * factr(n-1)
      end	
    end #End of factr



 #Imperative style using "while loop"
 
    def factw (n)
	 acc = 1
	 while n>0
		 acc = n * acc
		 n = n -1
	end
	return acc
     end #End of factw


   #Another Functional style

    def fact(n) 
	return factrw(n,1)
    end # end of fact -- fact calls a recursive factrw

    def factrw (n,acc) 
	 if n > 0 
		 return factrw(n-1, n*acc)
	else
		return acc
	end # if
    end # end of factfw
	

 
end #End of Module


# To use methods in IRB we need to include this module

include Fact
puts factf(8)  # Prints out the result of fact(8) 
puts factb(8)
puts factr(8)
puts factw(8)
puts fact(8)


# now we can call any method in Fact by it's simple name.
