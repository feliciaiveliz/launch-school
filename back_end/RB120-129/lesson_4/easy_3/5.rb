# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# What would happen if I called the methods like shown below?

tv = Television.new
tv.manufacturer # this would output an error as this is a class method and they are not called on instances of a class
tv.model # This would output the body of the 'model' method

Television.manufacturer # this would output the body of the 'manufacturer' method
Television.model # this would output an error as 'model' is an instance method and is only available to use by instances of the class
