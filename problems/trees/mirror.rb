# Find the mirror of a binary tree
#
#   2
# 1   5
#    4 6
#
# Mirrored :
#    2
#  5   1
# 6 4 


def mirror(node)
    return if node.nil?

    temp = node.left
    node.left = node.right
    node.right = temp

    mirror(node.left)
    mirror(node.right)
end
