###
# Implement a Binary Search Tree
# add()
# search()
#

require './tree_node'

class BST
    attr_accessor :root

    def add(val)
        node = Node.new(val)
        if @root.nil?
            @root = node
            return
        end

        rec_add(@root, node)
    end

    private

    def rec_add(node, target)

        if target.value < node.value
            if node.left.nil?
                node.left = target
            else
                rec_add(node.left, target)
            end
        elsif target.value >= node.value
            if node.right.nil?
                node.right = target
            else
                rec_add(node.right, target)
            end
        end
    end

    def rec_search(node, val)
        return nil if node.isleaf?

        if val < node.value
            rec_search(node.left, val)
        elsif val > node.value
            rec_search(node.right, val)
        elsif val == node.value
            return node
        end
    end
end



b = BST.new
b.add(1)
b.add(22)
b.add(3)

