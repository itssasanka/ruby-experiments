require_relative './errors.rb'

class Queue
    def initialize(s)
        @size = s
        @array = []
    end

    def size
        @array.size
    end

    def push(e)
        raise OutOfBounds.new("queue full") if size == @size
        @array << e
    end

    def pop
        raise OutOfBounds.new("Queue empty") if size == 0
        @array.shift
    end
end