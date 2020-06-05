class Person
  attr_reader :name

  def initialize(name, has_secret)
    @name = name
    @has_secret = has_secret
  end

  def has_secret?
    self.secret
  end

  private

  def secret
    "I like dogs better than cats"
  end
end

felicia = Person.new("Felicia", true)
kayla = Person.new("Kayla", false)

puts felicia.has_secret?