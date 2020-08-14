# Ruby Basics > Loops 1

# Runaway Loop- The code below is an example of an infinite loop. The name describes exactly what it does: 
# loop infinitely. This loop isn't useful in a real program, though. Modify the code so the loop stops after the 
# first iteration.
# Add a break to the loop. 

# loop do 
#   puts 'Just keep printing...'
# end

loop do
  puts 'Just keeping printing...'
  break
end

# 2. Loopception- The code below is an example of a nested loop. Both loops currently loop infinitely. Modify the code so
# each loop stops after the first iteration.

# loop do 
#   puts 'This is the outer loop.'

#   loop do
#     puts 'This is the inner loop.'
#   end
# end

puts 'This is outside all loops.'

loop do 
  puts 'This is the outer loop.'
  
  loop do
    puts 'This is the inner loop.'
    break
  end
  
  break
end

puts 'This is outside all loops.'

# 3. Control the Loop- Modify the following loop so it iterates 5 times instead of just once.

iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  iterations += 1
  break if iterations > 5
end

# Further Explorations

iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  break if iterations > 5
  iterations += 1
end

# 4. Loop on Command- Modify the code below so the loop stops iterating when the user inputs 'yes'.

loop do 
  puts 'Should I stop looping?'
  answer = gets.chomp
end

loop do 
  puts 'Should I stop looping?'
  answer = gets.chomp
  break if answer == 'yes'
  puts 'Please enter only yes.'
end

# 5. Say Hello- Modify the code below so "Hello!" is printed 5 times.

say_hello = true

while say_hello
  puts 'Hello!'
  say_hello = false
end

say_hello = true
counter = 0

while say_hello
  puts 'Hello!'
  counter += 1
  say_hello = false if counter == 5
end

5.times { puts 'Hello!' }

# 6. Print While- Using a while loop, print 5 random numbers between 0 and 99. The code below shows an example of
# how to begin solving this exercise.

numbers = []

while <condition>
  # ...
end

numbers = []

while numbers.size <= 5
  numbers << rand(100)
end

puts numbers

# 7. Count Up- The following code outputs a countdown from 10 to 1. Modify the code so that it counts from 1 to 10 instead.

count = 10

until count == 0
  puts count
  count -= 1
end

count = 1

until count > 10
  puts count 
  count += 1
end

# 8. Print Until- Given the array of several numbers below, use an until loop to print each number.

numbers = [7, 9, 13, 25, 18]

until numbers.empty?
  puts numbers
  break
end

numbers = [7, 9, 13, 25, 18]
count = 0

until count == numbers.size
  p numbers[count]
  count += 1
end

numbers = [7, 9, 13, 25, 18]

until numbers.empty?
  puts numbers.shift
end

# 9. That's Odd- The code below shows an example of a for loop. Modify the code so that it only outputs i if i is an odd number.

for i in 1..100
  puts i if i.odd?
end

# 10. Greet Your Friends- Your friends just showed up! Given the following array of names, use a for loop to greet each friend individually.

friends = ['Sarah', 'John', 'Hannah', 'Dave']

for friend in friends
  puts "Hello, #{friend}!"
end

friends.each { |friend| puts "Hello, #{friend}!" }
