class Node
    attr_accessor :left, :right, :value

    def initialize(val)
        self.value = val
    end

    def isleaf?
        self.left.nil? && self.right.nil?
    end
end
