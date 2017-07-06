require './bst'

def preorder(node)
    return if node.nil?
    print " #{node.value} "

    preorder(node.left)
    preorder(node.right)
end

def postorder(node)
    return if node.nil?

    postorder(node.left)
    postorder(node.right)
    print " #{node.value} "
end

def inorder(node)
    return if node.nil?

    inorder(node.left)
    print " #{node.value} "
    inorder(node.right)
end

b=BST.new
b.add(5)
b.add(6)
b.add(1)
b.add(9)

p preorder(b.root)
p postorder(b.root)
p inorder(b.root)
