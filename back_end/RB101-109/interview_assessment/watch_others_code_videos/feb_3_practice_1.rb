# # # Write a method that will take an array of numbers, and return only those that are prime.

# # def prime?(number)
# #   return false if number == 1
# #   (2..(number - 1)).each do |i|
# #     return false if number % i == 0
# #   end
# #   true
# # end

# # p prime?(1) # false
# # p prime?(2) # true
# # p prime?(3) # true
# # p prime?(4) # false

# # # Write a method that will take an array of numbers, and return the number of primes in the array.

# # def select_primes(array)
# #   array.select { |element| prime?(element) }
# # end

# # p select_primes([1]) # []
# # p select_primes([1, 2, 3, 4]) # [2, 3]
# # p select_primes([4, 6, 8, 10]) # []

# # # Write a method that will take an array of numbers, and return the number of primes in the array

# # def count_primes(array)
# #   select_primes(array).count
# # end

# # p count_primes([1, 2, 3, 4])
# # p count_primes([4, 6, 8, 10])

# # Write a program that asks a user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers
# # between 1 and the entered integer.

# def sum(number)
#   (1..number).to_a.inject(:+)
# end

# def product(number)
#   (1..number).to_a.inject(:*)
# end

# puts "Enter a number greater than 0: "
# number = gets.chomp.to_i

# puts "Enter 's' to compute the sum or 'p' to compute the product."
# user_input = gets.chomp.downcase

# if user_input == 's'
#   sum = sum(number)
#   puts "The sum of the integers between 1 and #{user_input} is #{sum}."
# else
#   product = product(number)
#   puts "The product of the integers between 1 and #{user_input} is #{product}."
# end

# Interleave two arrays

def interleave(a, b)
  result = []
  a.size.times do |index|
    result << a[index] << b[index]
  end
  result
end

def interleave(a, b)
  a.zip(b).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c'])
