1. 

2. 

3. 

```ruby
class Move
  VALUES = %w(rock paper scissors lizard spock)
  
    def initialize(value)
      @value = value
    end
  
    def scissors?
      @value == 'scissors'
    end
  
    def rock?
      @value == 'rock'
    end
  
    def paper?
      @value == 'paper'
    end
  
    def lizard?
      @value == 'lizard'
    end

    def spock?
      @value == 'spock'
    end
    
    def >(other_move)
      (rock? && other_move.scissors?) ||
        (paper? && other_move.rock?) ||
        (scissors? && other_move.paper?)
    end
  
    def <(other_move)
      (rock? && other_move.paper?) ||
        (paper? && other_move.scissors?) ||
        (scissors? && other_move.rock?)
    end
  
    def to_s
      @value
    end
end
```
