require './trie_node'

class Trie
    attr_accessor :root

    def initialize
        self.root = TrieNode.new
    end


    def add(val)
        add_rec(self.root, val.chars)
    end


    def autocomplete(string)
        result = []
        start_node = search_rec(string.chars, self.root)
    
        autocomplete_rec(start_node, result, string)
        return result
    end

    private

    def autocomplete_rec(node, result, string)
        unless node.has_children?
            result << string
            return
        end

        node.children.each do |k, v|
            new_string = string + k
            autocomplete_rec(v, result, new_string)
        end
    end

    def search_rec(val, node)
        char = val.first
        target_node =  nil

        if node.children.has_key?(char)
            target_node = node.children[char]
        else 
            return node
        end

        return search_rec(val[1..-1], target_node)
    end

    def add_rec(node, val)
        return if val.empty?

        char = val.first
        target_node = TrieNode.new

        if node.children.has_key?(char)
            target_node = node.children[char]
        else
            node.children[char] = target_node    
        end

        add_rec(target_node, val[1..-1])
    end
end
