class TrieNode
    attr_accessor :children

    def initialize
        self.children = {}
    end

    def has_children?
        !self.children.empty?
    end
end
