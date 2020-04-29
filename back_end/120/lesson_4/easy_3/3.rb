# When objects are created they are a separate realization of a particular class.
# Given the class below, how do we create two different instances of this class, both with separate names and ages?

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

bad_cat1 = AngryCat.new(3, "gian")
bad_cat2 = AngryCat.new(1, "kaathe")

puts bad_cat1.age
puts bad_cat1.name
puts bad_cat1.hiss

puts bad_cat2.age
puts bad_cat2.name
puts bad_cat2.hiss