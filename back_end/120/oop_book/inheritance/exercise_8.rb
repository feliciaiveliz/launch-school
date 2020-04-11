# Given the following code...

bob = Person.new
bob.hi

# Move the 'hi' method above the 'private'

class Person
  def hi
  end
  
  private
end

bob = Person.new
bob.hi