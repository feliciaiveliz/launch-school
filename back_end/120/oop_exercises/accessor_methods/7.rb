# Prefix the Name

# Using the following code, add the appropriate accessor methods so that @name is returned with the added prefix 'Mr.'.

class Person
  attr_reader :name

  def name=(name)
    @name = "Mr. #{name}"
  end
end

# or

class Person
  attr_writer :name

  def name
    "Mr. #{@name}"
  end
end

person1 = Person.new
person1.name = "James" # setter
puts person1.name # getter 

