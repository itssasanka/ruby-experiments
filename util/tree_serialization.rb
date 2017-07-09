require_relative './bst.rb'
require_relative './tree_node.rb'
require_relative './list_iterator.rb'

# Serialize a tree in preorder
#

def serialize(node, list)
    if node.nil?
        list << nil
        return
    end
    list << node.value

    serialize(node.left, list)
    serialize(node.right, list)
end

def deserialize(iterator)
    val = iterator.next if iterator.has_next?
    return nil if val.nil?

    parent = Node.new(val)
    parent.left = deserialize(iterator)
    parent.right = deserialize(iterator)

    return parent
end

b=BST.new
b.add(5)
b.add(6)
b.add(1)
b.add(9)
b.add(3)
b.add(13)

list = []
serialize(b.root, list)

iterator = ListIterator.new(list)
deserialized_root = deserialize(iterator)

# Verification
new_list = []; serialize(deserialized_root, new_list)
puts new_list == list