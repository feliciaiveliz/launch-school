def remove_vowels(array)
  array.map { |string| string.delete('aeiouAEIOU') }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']


def reverse!(list)  
  list.size.times { |n| list.insert(n, list.pop) }
  list
end

list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]

list = ['abc']
p reverse!(list) == ["abc"]
p list == ["abc"]

list = []
p reverse!(list) == []
p list == []


def reverse(list)
  new_list = list.dup

  new_list.size.times do |n|
    new_list.insert(n, new_list.pop)
  end
  new_list
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true


def merge(a, b)
  a | b
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]


def find_dup(array)
  array.find { |n| array.count(n) > 1 }
end

p find_dup([1, 5, 3, 1]) #== 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) #== 73


def find_uniq(list)
  number = list.find { |n| list.count(n) > 1 }
  list.each { |n| return n if n != number }
end

def find_uniq(list)
  number = list.find { |n| list.count(n) > 1 }
  list.find { |n| n if n != number }
end

def find_uniq(list)
  list.find { |n| list.count(n) == 1 }
end

p find_uniq([ 1, 1, 1, 2, 1, 1 ]) #== 2
p find_uniq([ 0, 0, 0.55, 0, 0 ]) #== 0.55


def include?(list, value)
  return true if list.count(value) > 0
  false
end

def include?(list, value)
  list.count(value) > 0
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false


def interleave(a, b)
  (a.zip(b)).flatten
end

def interleave(a, b)
  array = []

  a.each_with_index do |n, idx|
    array << n << b[idx]
  end

  array
end

p interleave([1, 2, 3], ['a', 'b', 'c']) #== [1, 'a', 2, 'b', 3, 'c']

def find_uniq(list)
  list.find { |n| list.count(n) == 1 }
end

p find_uniq([1,1,1,1,0]) == 0
p find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
p find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55
p find_uniq([ 4, 4, 4, 3, 4, 4, 4, 4 ]) == 3
p find_uniq([ 5, 5, 5, 5, 4, 5, 5, 5 ]) == 4
p find_uniq([ 6, 6, 6, 6, 6, 5, 6, 6 ]) == 5
p find_uniq([ 7, 7, 7, 7, 7, 7, 6, 7 ]) == 6
p find_uniq([ 8, 8, 8, 8, 8, 8, 8, 7 ]) == 7
p find_uniq([ 3, 3, 2, 3, 3, 3, 3, 3 ]) == 2
p find_uniq([ 2, 1, 2, 2, 2, 2, 2, 2 ]) == 1
p find_uniq([ 0, 1, 1, 1, 1, 1, 1, 1 ]) == 0