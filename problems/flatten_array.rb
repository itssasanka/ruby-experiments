# Given an array and a level limit, flatten
# the array until that level
# ex: [1,2,3,[4,5]] limit: 1 => [1,2,3,4,5]
# ex: [1,2,3,[4,[7,8]],9] limit :2 => [1,2,3,4,[7,8],9]

require 'pry'

def flatten(inp, level)
    master = []
    rec_flatten(0, inp, level, master)

    master
end


def rec_flatten(level, cur, limit, master)
    if cur.is_a? Array
        level += 1

        if level <= limit
            cur.each do |c|
                rec_flatten(level, c, limit, master)
            end
        else
            master << cur
        end
    else
        master << cur
    end
end


inp = [1,2,3,[4,[7,8]],9] 
print flatten(inp, 2)
