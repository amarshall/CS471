#!/usr/bin/ruby
# sample tree class
class Tree
	
	# "You can think of  ':label' as meaning the "name" label and plain label as meaning the "value" of the variable i.e. 
	#  the accessor method of the corresponding instance variable '@label'.
	#  This elimates the need for user defined accessor methods.
	#  In addition to "attr_reader" there is "attr_accessor" and "attr_writer"
	
	
	attr_reader :label, :left, :right

	def initialize(label, left = nil,  right= nil )
		raise "Label must be provided" if label == nil
		# All instance variables begin with a single "@".
		# All class variables begin with two "@@"
		@label = label
		@left = left
		@right = right
	end
	
	def to_s
		s = label.to_s
		if @left != nil then
			s = s.to_s + " " + @left.to_s
		end
		if nil != @right then
			s = s.to_s + " " +@right.to_s
		end
	end
	
	def each(&block)
		yield @label
		if  @left != nil  then 
			@left.each (&block)
		end
		
		if  @right != nil  then 
			@right.each(&block)
		end
	end
	
	def Tree.factory(lst)
		n = lst.length
		if n == 0 then
			return nil
		end
		if n == 1 then
			return Tree.new(lst[0])
		end
		i = n /2
		return Tree.new(lst[i], Tree.factory(lst[0 .. i-1]),Tree.factory(lst[i+1 .. n-1]))
	end
	
	def Tree.printIndent(tree, level=0)
		
		if tree.right != nil then
			printIndent(tree.right, level+1)
		end
		puts '  '*level + level.to_s
		if tree.left != nil then
			printIndent(tree.left, level+1)
		end
	end
	
	def Tree.prt(tree, level = 0)
		if tree.right != nil then
			prt(tree.right, level +1)
		end
		puts '.. '*level + tree.label.to_s
		if tree.left != nil then
			prt(tree.left, level+1)
		end
	end
	
   
end

# some testing --- Will execute when loaded

tree1 = Tree.factory([11,21,31,41,51,61,71,81,91])
Tree.printIndent(tree1)

# "{..}" denotes code block that can be passed as a parameter. 
# Code blocks can be used to implement callbacks, to pass around chunks of code 
#           and to implement iterators.

sum = 0
tree1.each {|x| sum += x}
puts "1:Sum of values in Tree:" + sum.to_s

## the only built-in primitives are while and until .. however "for" is syntactic sugar
## If 'each' is defined then you can use a "for in"
## 'while', 'until' and 'for' loops do not introduce new scopes
## blocks used by iterators do form new scopes

sum = 0
for x in tree1 
	sum+= x
end
puts "2:Sum of values in Tree:" + sum.to_s + "\n"

i=0
tree1.each do |e| i += 1; puts i.to_s + ": " + e.to_s end	

print("TREE1 using tree1.to_s")
Tree.prt(tree1)

print("Using {} notation\n")
i=0
tree1.each { |e| i += 1; puts i.to_s + ": " + e.to_s }	

#
# i = 0
# tree1.preorder do |e| i += 1; puts i.to_s + ": " + e.to_s end

#### Output for preorder 
## 1: 51
## 2: 31
## 3: 21
## 4: 11
## 5: 41
## 6: 81
## 7: 71
## 8: 61
## 9: 91
