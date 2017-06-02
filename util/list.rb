require './node'

class List
    attr_accessor :head

    def initialize(max_size)
        @max_size = max_size
    end

    def add(val)
        n = Node.new(val)
        if self.head.nil?
            self.head = n
        else
            cur = @head
            while cur.next_node
                cur = cur.next_node
            end
            cur.next_node = n
        end
    end

    def print_list
        cur = @head
        while cur
            p cur.value
            cur = cur.next_node
        end
    end
end
