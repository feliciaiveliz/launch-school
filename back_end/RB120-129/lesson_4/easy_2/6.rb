# Which one of these is a class method (if any) and how do you know? How would you call a class method?

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# The class method is the one that is called 'self.manufacturer'. 
# Class methods start with 'self' to refer to the class itself. All other methods within a class are instance methods.
