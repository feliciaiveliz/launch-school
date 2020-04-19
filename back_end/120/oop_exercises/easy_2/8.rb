class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    expand(3)
  end

  private

  def expand(n)
    @string * n
  end
end

# or change the 'private' to 'protected'
expander = Expander.new('xyz')
puts expander

