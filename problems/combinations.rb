# Given a string (or list of chars), print out all combinations of characters
# "a", "b", "c", "d"
# Output:
# "ab" "ac" "ad" "bc" "bd" "abc" "abd" "acd" "bcd" "abcd"
#
def combinations(string)
    master = []

    for size in 2..string.size do
        rec_comb(string, master, "", size)
    end

    puts master
end

def rec_comb(remaining, master, string, size)
    if string.size == size
        master << string
        return 
    end
    for i in 0..remaining.size-1 do
        new_string = string + remaining[i]
        next_remaining = remaining[i+1..remaining.size-1]
        rec_comb(next_remaining, master, new_string, size)
    end
end

combinations "abcdef"
