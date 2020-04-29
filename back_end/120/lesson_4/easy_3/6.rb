# If we have a class such as the one below:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    @age += 1 # self is referencing the setter method provided by the 'attr_accessor'
  end
end

cat = Cat.new("tabby")
puts cat.make_one_year_older
puts cat.make_one_year_older
# In the make_one_year_older method we have used self. What is another way we could write this method so we don't have to use the self prefix?