# Your task is to sort a given string. Each word in the string will contain a single number. This number is the position the word should have in the result.

# Note: Numbers can be from 1 to 9. So 1 will be the first word (not 0).

# If the input string is empty, return an empty string. The words in the input String will only contain valid consecutive numbers.


=begin

input: string, words contain integer
output: sorted string based on integer
problem:
- what should be done with the input?
  - iterate over sentence:, given each word:
  - split the word into characters
    - convert each char into integer
      - if the result is not 0, sort words based on the integer
ALGORITHM:
- initialize 'result' to []
- use #split to sentence into words, iterate using #each
- use #chars and #sort_by to split words into chars:, given char
  - sort character if char #to_i is *not* 0
- end string
=end

def order(string)
  string.split.each do |word|
    string.sort_by do |char|
      
    end
  end
end

p order("is2 Thi1s T4est 3a") #== "Thi1s is2 3a T4est"
p order("4of Fo1r pe6ople g3ood th5e the2") #== "Fo1r the2 g3ood 4of th5e pe6ople"
p order("") #== ""

function order(text) {
  let words = text.split(' ');
  return words.sort((a, b) => Number(a.replace(/[^1-9]/g, '')) - Number(b.replace(/[^1-9]/g, '')));
}

# You're saying good-bye to your best friend, See you next happy year.

# Happy Year is the year with only distinct digits, (e.g) 2018.

# Year Of Course always Positive .
# Have no fear, It is guaranteed that the answer exists .
# It's not necessary that the year passed to the function is Happy one.
# Input Year with in range (1000  ≤  y  ≤  9000)

=begin

input: integer, year
output: integer, year with distinct digits
problem:
- what should be done with the input?
  - given year, incrment year by 1 
  - if the year contains no duplicate digits, return the year
ALGORITHM:
- loop:
  - increment 'year' by 1
    - if year #digits is equal to calling #uniq on current year
      - year contains unique digits
  - break out of the loop
- return the year
=end

def next_happy_year(year)
  loop do 
    year += 1
    break if year.digits == year.digits.uniq
  end
  year
end

p next_happy_year(1001) == 1023
p next_happy_year(1123) == 1203 
p next_happy_year(2001) == 2013
p next_happy_year(2334) == 2340

# You've just discovered a square (NxN) field and you notice a warning sign. The sign states that there's a single bomb in the 2D grid-like field in front of you.

# Write a function mineLocation/MineLocation that accepts a 2D array, and returns the location of the mine. The mine is represented as the integer 1 in the 2D array. Areas in the 2D array that are not the mine will be represented as 0s.

# The location returned should be an array (Tuple<int, int> in C#) where the first element is the row index, and the second element is the column index of the bomb location (both should be 0 based). All 2D arrays passed into your function will be square (NxN), and there will only be one mine in the array.

=begin

input: array of arrays, with 0s and 1s
output: array of two integers, row index of mine, and column index of mine location
problem:
- iterate over larger array, given subarray:
  - find element that is equal to 1
  - return index of current array in the larger array
  - return index of the mine location in the current array
- return both indexes in an array
ALGORITHM:
- initialize 'result' to []
- iterate over 'field' using #each, given 'row'
  - if 'row' includes 1, use #index on 'field',pass in 'row'
    - push this index to 'result'
  - use #find_index to find the element's index that equals 1
- return 'result'
=end

def mine_location(field)
  result = []
  field.each do |row|
    if row.include?(1)
      result << field.index(row)
      result << row.find_index { |n| n == 1 }
    end
  end
  result 
end

p mine_location( [ [1, 0, 0], [0, 0, 0], [0, 0, 0] ] ) == [0, 0]
p mine_location( [ [0, 0, 0], [0, 1, 0], [0, 0, 0] ] ) == [1, 1]
p mine_location( [ [0, 0, 0], [0, 0, 0], [0, 1, 0] ] ) == [2, 1]