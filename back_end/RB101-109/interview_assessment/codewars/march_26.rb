# The first input array contains the correct answers to an exam, like ["a", "a", "b", "d"]. The second one is "answers" array and contains student's answers.

# The two arrays are not empty and are the same length. Return the score for this array of answers, giving +4 for each correct answer, -1 for each incorrect answer, and +0 for each blank answer(empty string).

# If the score < 0, return 0.

=begin

input: two arrays, answers for exam
output: integer, student score
problem:
- iterate over both arrays:
  - compare actual score to student score
    - if both equal, add 4 to student score
    - if not equal, subtract 1 from score
    - if student score is empty, add 0
- return student score
ALGORITHM:
- initialize 'score' to 0
- use #each_with_index to iterate over 'arr1':
    - compare 'actual' score to 'student'
      - IF 'actual' is equal to 'student'  
        - increment score += 4
      - ELSIF 'student' is empty?
        - score += 0
      - ELSE 'actual' is not equal to 'student'
        - decrement score -= 1
      - END
  - end
- return score
=end

def check_exam(arr1, arr2)
  score = 0
  arr1.each_with_index do |actual, index|
    if actual == arr2[index]
      score += 4
    elsif arr2[index].empty?
      score += 0
    else
      score -= 1
    end
  end
  score.negative? ? 0 : score
end

p check_exam(["a", "a", "b", "b"], ["a", "c", "b", "d"]) == 6
p check_exam(["a", "a", "c", "b"], ["a", "a", "b",  ""]) == 7
p check_exam(["a", "a", "b", "c"], ["a", "a", "b", "c"]) == 16
p check_exam(["b", "c", "b", "a"], ["",  "a", "a", "c"]) == 0

# You've just discovered a square (NxN) field and you notice a warning sign. The sign states that there's a single bomb in the 2D grid-like field in front of you.

# Write a function mineLocation/MineLocation that accepts a 2D array, and returns the location of the mine. The mine is represented as the integer 1 in the 2D array. Areas in the 2D array that are not the mine will be represented as 0s.

# The location returned should be an array where the first element is the row index, and the second element is the column index of the bomb location (both should be 0 based). All 2D arrays passed into your function will be square (NxN), and there will only be one mine in the array.

=begin

input: array of 3 subarrays, that contain 0s and 1s
output: array of 2 integers, bomb locations
problem:
- find the bomb:
  - 1 indicates bomb area.
  - iterate through each subarray, once current area is 1
    - return an array of [subarray_index, bomb_index (in subarray]
ALGORITHM:
- initialize 'bomb_area' to []
- use #each to iterate over general array, given subarray:
  - find 1:
    - if subarray does not include 1: skip iteration
    - use #index to find area that equals 1
    - if 1 is found, push to 'bomb_area': index of subarray, index of 1
- return bomb_area
=end

def mine_location(field)
  bomb_area = []
  
  field.each do |row|
    next if !row.include?(1)
    bomb_area << field.index(row) << row.index(1)
  end
  
  bomb_area
end

p mine_location( [ [1, 0, 0], [0, 0, 0], [0, 0, 0] ] ) == [0, 0]
p mine_location( [ [0, 0, 0], [0, 1, 0], [0, 0, 0] ] ) == [1, 1]
p mine_location( [ [0, 0, 0], [0, 0, 0], [0, 1, 0] ] ) == [2, 1]

# Thinkful - Number Drills: Blue and red marbles | 8 kyu

# You and a friend have decided to play a game to drill your statistical intuitions. The game works like this:

# You have a bunch of red and blue marbles. To start the game you grab a handful of marbles of each color and put them into the bag, keeping track of how many of each color go in. You take turns reaching into the bag, guessing a color, and then pulling one marble out. You get a point if you guessed correctly. The trick is you only have three seconds to make your guess, so you have to think quickly.

# You've decided to write a function, guessBlue() to help automatically calculate whether you should guess "blue" or "red". The function should take four arguments:

# the number of blue marbles you put in the bag to start
# the number of red marbles you put in the bag to start
# the number of blue marbles pulled out so far (always lower than the starting number of blue marbles)
# the number of red marbles pulled out so far (always lower than the starting number of red marbles)
# guessBlue() should return the probability of drawing a blue marble, expressed as a float. For example, guessBlue(5, 5, 2, 3) should return 0.6.

def guess_blue(blue_start, red_start, blue_pulled, red_pulled)
  blue_left = blue_start - blue_pulled
  red_left = red_start - red_pulled
  total_left = blue_left + red_left
  blue_probability = blue_left.to_f / total_left
  blue_probability
end

# breaking it down step by step makes it easier to keep track of variables.

# Write a function that rearranges an integer into its largest possible value.

=begin
input: integer
output: integer, largest possible value
problem:
- puts digits into array using #digits
- sort digits using #sort b <=> a
- convert to string using #join
- convert to integer using #to_i
=end

def super_size(n)
  n.digits.sort { |a, b| b <=> a }.join.to_i
end

p super_size(123456) # 654321
p super_size(105)    # 510
p super_size(12)     # 21

# Complete the function, which calculates how much you need to tip based on the total amount of the bill and the service.

# You need to consider the following ratings:

# Terrible: tip 0%
# Poor: tip 5%
# Good: tip 10%
# Great: tip 15%
# Excellent: tip 20%
# The rating is case insensitive (so "great" = "GREAT"). If an unrecognised rating is received, then you need to return:

# "Rating not recognised" in Javascript, Python and Ruby...
# ...or null in Java
# ...or -1 in C#
# Because you're a nice person, you always round up the tip, regardless of the service.

=begin

input: integer: bill total, rating: string
output: integer or string, tip amount or error message
problem:
- downcase all ratings
- multiply bill total by tip percentage based on rating
- convert tip percentage by multiplying by 0.01
- return tip amount after rounding up
- if rating is not recognized, return error message
ALGORITHM:
- case statement
  - if rating == "Poor".downcase
    - return bill * .05 #ceil
  - if rating.downcase == "Excellent".downcase
    - return bill * .10 #ceil
  - etc.
- else
  - 'Rating not recognised'
=end

def calculate_tip(bill, rating)
  rating.downcase!
  
  if rating == "Terrible".downcase
    return 0
  elsif rating == "Poor".downcase
    return (bill * 0.05).ceil
  elsif rating == "Good".downcase
    return (bill * 0.10).ceil
  elsif rating == "Great".downcase
    return (bill * 0.15).ceil
  elsif rating == "Excellent".downcase
    return (bill * 0.20).ceil
  else
    return "Rating not recognised"
  end
end

p calculate_tip(30, "poor") == 2
p calculate_tip(20, "Excellent") == 4
p calculate_tip(20, "hi") == 'Rating not recognised'
p calculate_tip(107.65, "GReat") == 17
p calculate_tip(20, "great!") == 'Rating not recognised'

=begin

input: array of integers
output: integer, first non-consecutive integer
problem:
- put first integer of array into another array
- iterate over the input array;
  - if current number minus the last number in the other array
    - is != 1, return number
ALGORITHM:
- initialize 'previous' to arr.shift
- iterate over input array:
  - if n - previous != 1 or -1
    return n
  - assign previous to 'n'
- nil
=end

def first_non_consecutive(arr)
  previous = arr.shift
  
  arr.each do |n|
    if (n - previous != 1)
      return n
    else
      previous = n
    end
  end
  nil
end

def first_non_consecutive(arr)
  arr.each_cons(2) { |a, b| return b if b - a > 1 }
end

p first_non_consecutive([1,2,3,4,6,7,8]) #== 6

=begin

input: array of various data types
output: array with all even indexed items removed
problem:
- create a new array
- iterate over input array
- if item is at an odd index, add it to new array
ALGORITHM:
- iterate using #select and #wit_index, given item and index:
  - add item to result if index is #even
=end

def remove_every_other(arr)
  arr.select.with_index { |_, index| index.even? }
end

def triple_trouble(one, two, three)
  one.chars.map.with_index { |_, idx| one[idx] + two[idx] + three[idx] }.join
end