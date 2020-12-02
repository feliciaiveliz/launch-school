class Player
  attr_accessor :health

  def initialize(name, health = 50)
    @name = name
    @health = health
  end
  
  def name
    @name = @name.capitalize
  end
  
  def to_s
    if @health == -1 
      return'I was John, now I am dead :(.'
    else
      return "I'm John with health = 100."
    end
  end
  
  def boost
    raise NoMethodError if @health == -1 
    @health += 20
  end
  
  def health
    @health
  end
  
  def hurt
    raise NoMethodError if @health == -1
    @health -= 10
  end

  def dead?
    @health -= 1
  end
end
  