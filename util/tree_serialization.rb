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

def serialize_inorder(node, list)
    if node.nil?
        list << nil
        return
    end

    serialize_inorder(node.left, list)
    list << node.value
    serialize_inorder(node.right, list)
end
# [nil, 1, nil, 3, nil, 5, nil, 6, nil, 9, nil, 13, nil]

def deserialize_inorder(list)
    val = list.shift
    return nil if val.nil?
    
    left = Node.new(val)
    right = deserialize_inorder(list[1..-1])


    
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


inorder_list = []
serialize_inorder(b.root, inorder_list)
