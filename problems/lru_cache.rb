# Implement an LRU cache
# Ex: Size 4
# Input : Add 4 5 1 4 3 8
#
# Stages :  1  5  4
#           4  1  5
#           3  4  1  5
#           8  3  4  1
#

require 'set'

class LRU
    attr_reader :max_size
    def initialize(size)
        @max_size = size
        @set = Set.new
    end

    def add(v)
        if @set.include?(v)
            @set = @set - [v]
        end
        @set = Set.new([v]) + @set

        @set = @set.to_a[0..@max_size-1].to_set
    end


    def out
        @set.each do |s|
            print " #{s} "
        end
    end
end


l=LRU.new(4)
l.add(4)
l.add(5)
l.add(1)
l.add(4)
l.add(3)
l.add(8)

l.out
