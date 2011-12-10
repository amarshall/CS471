# A binary tree class.
class Tree:
    # Names with 2 leading and trailing underscores are system defined names
    #             that have special definition to the interpreter. (__X__)

    # The constructor for a tree
    # self.xxx=vvv, creates an instance variable, xxx, with the value, vvv.
    # "The first argument (called self by convertion) of a method references 
    # the instance object being processed;"

    def __init__(self, label, left=None, right=None):
        self.label = label
        self.left = left
        self.right = right

    # "If defined, __repr__ is called automatically when class instances
    #  are printed or converted to strings."
    
    def __repr__(self):
        s = repr(self.label)
        if self.left:
            s = s + " " + self.left.__repr__() 
       
        if self.right:
            s = s + " " + self.right.__repr__()
        return s

    
    # "All iteration contexts in Python will try the __iter__ method first. ...
    # Iteration context works by calling the builtin function iter to find an
    # __iter__ method, which is expected to find an iterator object.  If it is
    # provided, Python repeatedly calls this iterator object's next method
    # to produce the next item until a StopIteration exception is raised."
    def __iter__(self):
        def iter(t):
            if t:
                for x in iter(t.left):
                    yield x
                yield t.label
                for x in iter(t.right):
                    yield x
        return iter(self)
    
# 1) What order does __iter__() method traverse itself?
# 2) Define a method preorder() that returns a preorder iterator of the tree.
# 3) Define a method postorder() that returns a postorder iterator of the tree.

# "run TreeModule"
# >>> tree = treeFactory("abc")
# >>> for n in tree:
#         print (repr(n))
# a
# b
# c 
# >>> for n in tree.postorder():
#         print (repr(n))
# a
# c
# b

# >>> for n in tree.preorder():
#         print (repr(n))
# b
# a
# c
##  ADD class methods here >>>>
    
########### End of Class Tree ####################
 
#module functions

def treeFactory(list):
    n = len(list)
    if n == 0:
        return None
    i = n // 2  # use 1//2 instead of 1/2 to get the truncating behavior
    return Tree(list[i], treeFactory(list[:i]), treeFactory(list[i+1:]))

# Examples of Trees
tree1 = treeFactory([1,2,3,4])
# A tree if trees
tree2 = treeFactory([treeFactory([1,2,3,4]),treeFactory(['abc','dfg','stu','xyz'])])


# Pretty print the levels of a tree.
def printTreeIndented(tree, level=0):
  if tree == None : return
  if tree.right:
      printTreeIndented(tree.right, level+1)
  print ('  '*level + str(level))
  if tree.left:
      printTreeIndented(tree.left, level+1)
    

# >>> tree1 = treeFactory([1,2,3,4,5,6,7,8,9])
# >>> printTreeIndented(tree1)
#    2
#  1
#    2
#      3
# 0
#    2
#  1
#    2
#      3
# >>> tree2 = treeFactory([treeFactory([1,2,3,4]),treeFactory(['abc','dfg','stu','xyz'])])
# >>> printTreeIndented(tree2)
# 0
#  1
