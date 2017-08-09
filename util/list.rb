require_relative './general_node'

class List
    attr_accessor :head
    
    def initialize(max_size)
        @max_size = max_size
        @cur_size = 0
    end

    def add(val)
        check_size

        @cur_size += 1
        n = Node.new(val)
        if @head.nil?
            @head = n
        else
            cur = @head
            while cur.next_node
                cur = cur.next_node
            end
            cur.next_node = n
        end
    end

    def remove(index)
       c = 0
       cur = @head
       while cur
           if c+1 == index
               cur.next_node = cur.next_node.next_node
               @cur_size = @cur_size - 1
               return
           end
           c += 1
           cur = cur.next_node
       end
    end

    def print_list
        cur = @head
        while cur
            p cur.value
            cur = cur.next_node
        end
    end

    def reverse
        @head = reverse_rec(@head)[1] 
    end

    private
    
    def reverse_rec(cur)
        if cur.next_node
            last, new_head = reverse_rec(cur.next_node)
        else
            return [cur, cur]
        end

        last.next_node = cur
        cur.next_node = nil

        return [cur, new_head]
    end

    def check_size
        if @cur_size == @max_size
            raise StandardError.new "Cannot add more elements"
        end
    end
end
