# Flight Data 

class Flight
  attr_accessor :database_handle

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

# There is nothing technically incorrect about this class, but the definition may lead to problems in the future. How can this class be fixed to be resistant to future problems?

# By removing 'attr_accessor :database_handle' we can prevent unnecessary changes to the 'handle'
# This provides access to the instance variable and that can cause future implementations to it to break the code.
