def anagrams?(string1, string2)
    master_hash = {}

    return false unless string1.length == string2.length

    string1.each_char do |c|
        master_hash[c] = master_hash[c].to_i + 1
    end

    string2.each_char do |c|
        if master_hash[c].to_i == 0
            return false
        end
        master_hash[c] = master_hash[c].to_i - 1
    end

    return true
end 


p anagrams?('abc', 'cab')
p anagrams?('aab', 'aba')
p anagrams?('xyz', 'xxz')
