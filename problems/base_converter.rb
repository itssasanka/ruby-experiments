# Simple Base encoding
# Only for < Base 10
#
# Example, 11 in base 7 would be 14
#
def base_by(n, inp)
    to_be_divided = inp
    result = ""

    while to_be_divided > 0
        result << (to_be_divided % n).to_s
        to_be_divided = to_be_divided / n
    end

    return result.reverse.to_i
end


p base_by(7, 11)
