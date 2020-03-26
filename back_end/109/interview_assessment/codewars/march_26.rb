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
    - use #index to find area that equals 1
    - if 1 is found, push to 'bomb_area': index of subarray, index of 1
    - if subarray does not include 1: skip iteration
- return bomb_area
=end

def mine_location(field)
  bomb_area = []
  
  field.each do |area|
    next if !area.include?(1)
    bomb_area << field.index(area) << area.index(1)
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