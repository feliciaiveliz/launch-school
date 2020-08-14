# Public Secret

# Using the following code, create a class named Person with an instance variable named @secret. Use a setter method to add a value to @secret, then use a getter method to print @secret.

class Person
  attr_accessor :secret
end

person1 = Person.new
person1.secret = "Shh.. this is a secret!"
puts person1.secret

# or

class Person
  def secret
    @secret
  end

  def secret=(value)
    @secret = value
  end
end

