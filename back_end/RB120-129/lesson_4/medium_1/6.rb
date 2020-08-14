# If we have these two methods:

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

# and

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

# What is the difference in the way the code works?

# The first class uses the instance variable directly in the 'create_template' method. It uses the getting method to retrieve the variable in the 'show_template' method
# The second class uses 'self' to refer to the setter method in the 'create_template' method but uses 'self' to retrieve the variable, which 'template' would be better.
# They are opposite in their implementations. 'self' is used inside an instance method to reference the setter method to make a change, while the name of the getter method is used to retrieve it

# This might be better:

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231" # or @template but 'self' is better
  end

  def show_template
    template
  end
end