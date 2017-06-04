# Given a number, break it into an array of digits
# 12345 = [1,2,3,4,5]

def extract(n)
    to_be_divided = n
    list = []

    while to_be_divided != 0
        list << to_be_divided%10
        to_be_divided = to_be_divided/10
    end

    p list
end

extract 12345
