# Given two numbers A, B
# Output a number which has first digit of first number, then first digit of
# second number, then second of first number, second of second and so on
# decimal map ( 123, 45 ) is 14253
def dec(a, b)
    a_str = a.to_s
    b_str = b.to_s

    larger  = a_str.size > b_str.size ? a_str : b_str
    result = ""

    for i in 0..larger.size do 
        result += a_str[i].to_s
        result += b_str[i].to_s
    end

    puts result
end


dec(123, 4567)
