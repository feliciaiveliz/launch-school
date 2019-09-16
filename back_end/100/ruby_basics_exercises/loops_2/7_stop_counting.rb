# The method below counts from 0 to 4. Modify the block so that it prints the current number and stops iterating when the current number equals 2.

5.times do |index|
  puts index
  break if index == 2
end

# Further Exploration

5.times do |index| # this will print 0 1 2 3 4
  puts index
  break if index == 4
end

5.times do |index| # this will print 0 because it will execute 'puts index' once, and 0 is less than 7.
  puts index
  break if index < 7
end
