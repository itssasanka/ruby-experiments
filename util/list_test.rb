require './node'
require './list'

l=List.new 10
l.add 3
l.add 5
l.add 7
l.add 5
l.add 9
l.add 1


l.print_list
l.reverse
p '-'*30 
l.print_list
l.remove(3)
p '_'*30
l.print_list
