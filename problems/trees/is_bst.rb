# Determine whether a tree is a BST or not
# input : root node of a tree
# output : Boolean 
#


def is_bst?(node)
    return true if node.nil?

    unless ( node.left.value < node.value ) &&
           ( node.right.value >= node.value )
        return false
    end

    return is_bst?(node.left) && is_bst?(node.right)
end

