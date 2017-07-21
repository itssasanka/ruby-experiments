# Binary search
# Perform binary search on a list
#


def search(list, k)
    hi = list.size - 1
    lo = 0

    while(lo <= hi)
        mid = (lo + hi) /2
        
        if k > list[mid]
            lo = mid + 1
        elsif k < list[mid] 
            hi = mid - 1
        elsif k == list[mid]
            puts "Found at #{mid}"
            return
        end
    end
end


list = [1,2,3,4,5]
search(list, 5)
