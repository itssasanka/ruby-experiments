# given two strings, return whether they are at a distance of 
# 1 or not
# Ex: "abc", "ac" are at a distance 1
# Ex: "abc", "abcd" are at a distance 1
# Ex: "xyz", "xza" are not at a distance 1
#

def one?(s1, s2)
    if s1.size != s2.size
        if s1.size > s2.size 
            return one_removed?(s1, s2)
        end
        return one_removed?(s2, s1)
    end

    return one_replaced?(s1, s2)
end


def one_removed?(greater, lesser)
    for i in 0..greater.size-1 do
       if greater[i] != lesser[i]
           return greater[i+1..-1] == lesser[i..-1]
       end
    end
end


def one_replaced?(s1, s2)
    count = 0

    s1.size.times do |i|
        count += 1 unless s1[i] == s2[i]
        return false if count != 1
    end
   return true 
end

puts one?("abc", "ac")
puts one?("xza", "xzap")
puts one?("xyz", "xzr")
