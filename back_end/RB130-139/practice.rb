# What does this return, and why?

# p "hi".upcase { |el| el + "!!!!!"}

# HI

# Version 1
# def exclaim(array)
#   array.map {|item| yield(item)} 
# end

# value = '!!!'

# p exclaim(["hi", "bye"]) { |n| n + value }

# ["hi!!!", "bye!!!"]

# Version 2
# def exclaim(array, &block) 
#   value = '!'
#   array.map(&block)
# end

# value = '!!!'

# p exclaim(["hi", "bye"]) { |n| n + value }

# passing { |n| n + value } to exclaim
# & => proc
# passing proc object to array.map
# &block => block 
# array.map { |n| n + value }

# Version 3
# def exclaim(array, block) 
#   value = '!'
#   array.map(&block)
# end

# value = '!!!'

# new_proc = Proc.new  { |n| n + value }

# value = '...'

# p exclaim(["hi", "by"e], new_proc)

# value = '?'

# Break down what is happening here
# words = ["hi", "bye"]

# def d_method(arg1, &arg2)
#   arg1.map(&arg2) # { |n| n.upcase }
# end

# p d_method(words, &:upcase) # => ["HI", "BYE"]


Get the following code to return: ["hi!", "bye!"]

# def example(arg1, block_to_proc)   # you can change this line
#   arg1.map(&block_to_proc)
# end

# string = '!'

# proc_object = proc { |el| "#{el}#{string}" }
  
# p example(['hi', 'bye'], proc_object)     # you can change this line

# def multiply(array)
#   counter = 0

#   while counter < array.size
#     yield(array[counter])
#     counter += 1 
#   end

#   array
# end

# p multiply([1,2,3,4,5]) { |x| 'do nothing' }.select {|x| x.odd? }

# require 'minitest/autorun'

# class Cat
#   attr_accessor :name
# end

# class CatTest < MiniTest::Test
#   def test_value_equality
#     cat1 = Cat.new
#     cat2 = Cat.new

#     cat1.name = "Vaquita"
#     cat2.name = "Vaquita"

#     assert_equal(cat1, cat2)
#   end
# end

def exclaim(array, &block) 
  value = '!'
  p array.map(&block) # ['hi!!!', 'bye!!!']
  p block.call(array) # ['hi!!!', 'bye!!!', '!!!'] 
end

value = '!!!'

exclaim(["hi", "bye"]) { |n| n << value }

value = '!!'

def exclaim(array, &block) 
  value = '!'
  array.map(&block) 
  block.call(array).map! {|object| object = value} 
end

value = '!!!'

exclaim(["hi", "bye"]) { |n| n << value }

value = '!!'

