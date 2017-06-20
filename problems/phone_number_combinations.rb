# Given a dialpad on a phone with numbers 1 to 0, print all combinations of 
# a sequence of numbers that represents the letters corresponding to 
# that number
# Example -> 1 : abc, 2:def
# 12 should yield:
# ad, ae, af, bd, be, bf. cd, ce, cf
@numbers = {
    1 => ['a','b','c'],
    2 => ['d','e','f'],
    3 => ['g','h','i'],
    4 => ['j','k','l'],
    5 => ['m','n','o', 'p'],
    6 => ['q','r','s'],
    7 => ['t','u','v']
}


def rec_combine(remaining, string)
    if remaining.empty?
        puts string
        return
    else
        num = remaining.first.to_i
        @numbers[num].each do |c|
            new_string = string + c
            new_remaining = remaining[1..-1]
            rec_combine(new_remaining, new_string)
        end
    end
end

def combine(string)
    rec_combine(string.chars, "")
end

combine("123")


