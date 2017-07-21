# Get the nth element from the end of linkedlist
# 1->3->5->6-> 9
# 3rd from last 
# output: 5

require_relative '../util/general_node.rb'
require_relative '../util/list.rb'

def nth_from_end(n, node)
    if node.next_node.nil?
        return 1
    end

    k = 1 + nth_from_end(n, node.next_node)

    if k == n
        puts node.value
        exit(1)
    end
    return k
end


list = List.new(5)
list.add(3)
list.add(4)
list.add(5)
list.add(8)
list.add(9)

nth_from_end(3, list.head)

