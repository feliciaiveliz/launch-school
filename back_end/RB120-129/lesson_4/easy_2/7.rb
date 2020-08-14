# Explain what the @@cats_count variable does and how it works. What code would you need to write to test your theory?

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
    puts @@cats_count
  end

  def self.cats_count
    @@cats_count
  end
end

cat1 = Cat.new('tabby')
cat2 = Cat.new('siamese')

puts Cat.cats_count
# 1. @@cats_count is a class variable that keeps track of the number of 'cat' objects that belong to the class
# 2. Everytime an object is initialized, '@@cats_count' is incremented by 1. 