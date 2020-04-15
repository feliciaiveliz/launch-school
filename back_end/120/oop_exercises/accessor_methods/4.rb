# Comparing Names

# Using the following code, add the appropriate accessor methods. Keep in mind that the last_name getter shouldn't be visible outside the class, while the first_name getter should be visible outside the class.

class Person
  attr_accessor :first_name
  attr_writer :last_name
  
  def first_equals_last? # This has access to @last_name through the private accessor method
    first_name == last_name
  end

  private # Only 'Person' has access to this method :attr_reader

  attr_reader :last_name # last_name can't be invoked outside the class
end

person1 = Person.new
person1.first_name = "Dave"
person1.last_name = "Smith"
person1.last_name
puts person1.first_equals_last?