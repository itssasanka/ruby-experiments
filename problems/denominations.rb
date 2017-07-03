# Represent the number of ways an amount can be 
# achieved by adding different types of coins
# ex: coins = [0.5, 0.25]
#       Value = 2
#       Output : [0.5, 0.5]
#                [0.25,0.25,0.25,0.25]
#                [0.25, 0.25, 0.5]

require 'set'

def denominate(sum, list)
    final = Set.new

    rec_den(list.sort, [], sum.to_f, final)
    return final
end

def rec_den(master_list, cur_list, sum, final)
    s = sum(cur_list)
    if sum == s
        final << cur_list.sort
        return
    elsif s > sum
        return
    end

    master_list.each do |i|
        new_list = cur_list + Array(i)
        rec_den(master_list, new_list, sum, final)
    end
end

def sum(l)
    sum = l.inject{|s, x| s+ x}

    sum.to_f.round(2)
end



puts denominate(1, [0.1, 0.3]).inspect
