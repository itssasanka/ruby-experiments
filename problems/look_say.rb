# Given a number, look at it and form a new number which says
# how many times each digit is present
# look say (1) = 11
# look say(1123) = 211213 
# Print a series of the look and say series
def parse_num(n)
    count = 1
    digits = n.to_s.chars.map(&:to_i)
    prev = digits.first
    res = ""

    digits[1..-1].each do |cur|
       if cur == prev
           count += 1
       else
           res << "#{count}#{prev}"
           count = 1;
           prev = cur
       end
    end
    
    # Wrap up 
    res << "#{count}#{prev}"
    return res.to_i
end

def look_say(limit)
    res = 1
    limit.times do
       p res 
       res = parse_num(res) 
    end
end


look_say 4
