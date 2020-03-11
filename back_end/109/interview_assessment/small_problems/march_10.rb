def repeat(string, n)
  n.times { puts string }
end

p repeat('Hello', 3)

def is_odd?(n)
  n % 2 != 0
end

def is_odd?(n)
  n.abs.remainder(2) == 1
end

p puts is_odd?(2)    # => false
p puts is_odd?(5)    # => true
p puts is_odd?(-17)  # => true
p puts is_odd?(-8)   # => false
p puts is_odd?(0)    # => false
p puts is_odd?(7)    # => true

def digit_list(number)
  number.digits.reverse
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', 'suv'
]

def count_occurrences(array)
  count = array.tally

  count.each { |item, count| puts "#{item} => #{count}" }
end

def count_occurrences(array)
  hash = Hash.new

  array.each do |item|
    if hash.include?(item)
      item = item.downcase
      hash[item] += 1 
    else
      hash[item] = 1
    end
  end
  
  hash.each { |item, count| puts "#{item} => #{count}" }
end
p count_occurrences(vehicles)

