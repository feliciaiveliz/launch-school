# Rock Paper Scissors

### Game Flow

- User makes a choice
- Computer makes a choice
- winner is displayed

### Approach to OOP

1. Write a textural description of the problem or exercise
2. Extract the major nouns and verbs from the description
3. Organize and associate the verbs with the nouns
4. The nouns are the classes and the verbs are the behaviors or methods

### Textural Description

Step 1: Rock, Paper, Scissors is a two-player game where each player chooses
one of three possible moves: rock, paper, or scissors. The chosen moves
will then be compared to see who wins, according to the following rules:

- rock beats scissors
- scissors beats paper
- paper beats rock

If the players chose the same move, then it's a tie.

```ruby
Nouns: player, move, rule
Verbs: choose, compare
```

Step 2: We ignore 'rock', 'paper', or 'scissors' since they are variations on a move, almost like different states of a move. This way, we capture the major noun: move.

3. Organizing the verbs with the nouns: 

```ruby
Player 
  - choose
Move
Rule

- compare
```

What states should the objects have?

```ruby
class Player
  def initialize
    # maybe a name? what about a move?
  end

  def choose
  end
end

class Move
  def initialize
  # we should use something to keep track of the move
  # a move object can be paper, rock or scissors
  end
end

class Rule
  def initialize
    # not sure what the 'state' of a rule object should be yet
  end
end

def compare(move1, move2)
end
```

### Orchestration Engine

This is where procedural program flow should be. We will call the engine class 'RPSGame'. To play the game, we can instantiate an object and call a method called `play`:

```ruby
RPSGame.new.play
```

Class definition:

```ruby
class RPSGame
  def initialize
  end

  def play
  end
end
```

We can start to think about what objects are required in the `play` method to facilitate the game. 

```ruby
def play
  display_welcome_message
  human_choose_move
  computer_choose_move
  display_winner
  display_goodbye_message
end
```

There is duplication of the code. What if 'human' and 'computer' were both objects of the `Player` class? They would both have access to the `choose` method.

```ruby
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Player.new
    @computer = Player.new
  end

  def play
    display_welcome_message
    human.choose
    computer.choose
    display_winner
    display_goodbye_message
  end
end
```

