require_relative './errors.rb'

class ListIterator
    def initialize(l)
        @list = l
        @pointer = -1
        @size = @list.size
    end
    
    def has_next?
        @pointer + 1 <= @size - 1         
    end
    
    def has_previous?
        @pointer - 1 >= 0         
    end
    
    def next
        raise OutOfBounds.new("Already at the end") unless has_next?
        @pointer += 1
        @list[@pointer]
    end
    
    def previous
        raise OutOfBounds.new("Already at the beginning") unless has_previous?
        @pointer -= 1
        
        @list[@pointer]
    end
end