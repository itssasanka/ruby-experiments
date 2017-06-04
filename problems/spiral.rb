# Print a 2d matrix spirally
# [ 
#   [1,2,3],
#   [4,5,6],
#   [7,8,9]
# ]
#
# 1,2,3,6,9,8,7,4,5
#
def spiral(l, i , j)
    
    min_j = 0
    min_i = 0
    max_i = i - 1
    max_j = j - 1
    
    result = ""
    
    while true
        for j in min_j..max_j
            result << "#{l[min_i][j]},"   
        end
        min_i += 1
        break unless min_i <= max_i && min_j <= max_j

        for i in min_i..max_i
            result << "#{l[i][max_j]}," 
        end
        max_j -= 1
        break unless min_i <= max_i && min_j <= max_j

        for j in max_j.downto min_j
            result << "#{l[max_i][j]}," 
        end
        max_i -= 1
        break unless min_i <= max_i && min_j <= max_j

        for i in max_i.downto min_i
            result << "#{l[i][min_j]},"
        end
        min_j += 1
        break unless min_i <= max_i && min_j <= max_j
    end

    puts result[0..-2]
end

def process_input
    i, j = gets.chomp.split(",").map(&:to_i)
    a = []
    while true
        inp = gets.to_s.chomp
        break if inp == ""
        row = inp.split(",").map(&:to_i)
        a << row
    end
        
    spiral(a, i, j)
end

process_input
