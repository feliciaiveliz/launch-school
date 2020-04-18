# Fix the Program - Persons

# Complete this program so that it produces the expected output:
# John Doe
# Jane Smith

class Person
  attr_writer :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def to_s
    "#{@first_name.capitalize} #{@last_name.capitalize}"
  end
end

# or

class Person
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def first_name=(name)
    @first_name = first_name.capitalize
  end

  def last_name=(name)
    @last_name = last_name.capitalize
  end
  
  def to_s
    "#{@first_name.capitalize} #{@last_name.capitalize}"
  end
end

person = Person.new('john', 'doe')
puts person

person.first_name = 'jane'
person.last_name = 'smith'
puts person