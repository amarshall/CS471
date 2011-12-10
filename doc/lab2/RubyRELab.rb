#!/usr/bin/ruby
# sample ruby code
class Test
	# creates a text files, 
	
	#     Names.txt contains the strings that match the $2 group and is the name of a function.
	  
	
	# initialize is the constructor
   def initialize(pat, filename)
	   @pat = pat  #instance varable
	   puts(filename)
	   @name =  File.new(filename ,"w")

   end
   
   
  def wrtFile(filename)
	  @name.print("Info from File:: #{filename} \n  Data matching group 2 of RE Pattern:: #{@pat}\n\n" )
	   IO.foreach(filename) { |line| 
			# puts line
			# Match operator =~ returns the index of the first match :: string =~ re OR re =~ str
			if line =~ @pat
			   # $2    :: receives the "second" group
				@name.puts(" #{$2}")  
				end
			}
		@name.close
		
  end 
		
end

# Create an object which uses a user supplied RE and creates Name.txt file
# \s 	space (0x20), ")" is a meta character, "\)" will match the character ")", "."&"*" are meta character
# ex = Test.new( /(int)\s(.*)\(.*\)\s/  )

# read input file and write to the output files
# ex.wrtFile("Fig4_12.c")

ex = Test.new( /(int)\s(.*)\(.*\)\s/ ,"NameOfRules.txt" )
ex.wrtFile("lab2Rb.c")
 
# Comments beginning of line One Line and is on one line
 

