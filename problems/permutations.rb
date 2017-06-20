def permutate(string)
    rec_permutate(string, "")
end


def rec_permutate(remaining, string)
    if remaining.empty?
        puts string
        return
    end

    remaining.each_char do |e|
        new_string = string + e
        new_remaining = remaining.gsub(e, "")
        rec_permutate(new_remaining, new_string)
    end
end

permutate("abcd")
