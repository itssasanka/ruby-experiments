# Given a series of intervals (1,8), (2,3), (7, 11)
# Calculate the total magnitude of all the intervals combined and also
# the total magnitude between the intervals.
# Ex: (10,13), (2, 7), (1, 4), (12,15)
# Total: 6 + 5 = 11
# Free: (15-1) - 11 = 3 
def process_intervals(intervals)
    map = {}
    intervals.each do |i|
        map[i[0]] = false
        map[i[1]] = true
    end

    all = map.keys.sort
    total = 0
    previous = nil
    count = 0

    all.each do |a|
      if map[a]
          count -= 1
      else
          previous ||= a 
          count += 1
      end

      if count == 0
        total = total + (a - previous) 
        previous = nil
      end
    end

   total_inclusive = all.last - all.first 
   puts "Net total: #{total}"
   puts "free : #{total_inclusive - total}"
end


def process_input
    intervals = []
    while true
        interval = gets.to_s.chomp
        break if interval == ""
        intervals << interval.split(" ").map(&:to_i)
    end

    return process_intervals(intervals)
end

process_input
