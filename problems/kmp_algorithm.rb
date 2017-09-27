# Given a string abccabcdbabcdabcdabd 
# And a small string abcdabd, find the
# Index in the given string where the small string starts






##########
#########     INCOMPLETE
##########


require 'pry'

def kmp_search(main, sub)
    buffer = build_buffer(sub)
    pattern_pointer = 0
    chars = main.chars
    matched = 0
    for i in 0..chars.length do
        binding.pry
        if matched == buffer.size
            return chars[i-buffer.size+1]
        end
        if chars[i] == sub[pattern_pointer]
            matched = matched + 1
            pattern_pointer += 1
        else
            matched = buffer[pattern_pointer-1]
            pattern_pointer = buffer[pattern_pointer-1]
            i -= 1
        end
    end

    return -1
end

def build_buffer(pattern)
    list = pattern.chars
    buffer = [0]
    for i in 0..list.size
        j = i + 1
        
        while buffer.size != list.size
           if pattern[j] == pattern[i]
               buffer[j] = buffer[j-1] + 1
               j = j+1
               i = i+1
           else
               buffer[j] = buffer[buffer[j-1]]
               i = 0
               j = j+1
           end
        end
    end
    return buffer
end

 index = kmp_search('abccabcdbabcdabcdabd', 'abcdabd')
 puts index
