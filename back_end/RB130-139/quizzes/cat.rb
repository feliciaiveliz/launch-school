class Cat
  attr_accessor :name, :purr_factor

  def initialize(name)
    @name = name
  end

  def miaow
    "#{name} is miaowing."
  end
end