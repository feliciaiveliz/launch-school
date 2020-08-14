def prompt(msg)
  puts "=> #{msg}"
end

class Move
  attr_accessor :move, :beats

  def >(opponent_move)
    @beats.include?(opponent_move.to_s)
  end

  def to_s
    @move.to_s
  end
end

class Rock < Move
  def initialize
    @move = 'rock'
    @beats = %w(scissors lizard)
  end
end

class Paper < Move
  def initialize
    @move = 'paper'
    @beats = %w(rock spock)
  end
end

class Scissors < Move
  def initialize
    @move = 'scissors'
    @beats = %w(paper lizard)
  end
end

class Lizard < Move
  def initialize
    @move = 'lizard'
    @beats = %w(paper spock)
  end
end

class Spock < Move
  def initialize
    @move = 'spock'
    @beats = %w(rock scissors)
  end
end

class Player
  attr_accessor :name, :move, :score, :move_history

  MOVES = { 'rock' => Rock.new, 'paper' => Paper.new,
            'scissors' => Scissors.new, 'lizard' => Lizard.new,
            'spock' => Spock.new }

  def initialize
    set_name
    @score = 0
    @move_history = []
  end

  def add_move
    move_history.unshift(move)
  end
end

class Human < Player
  def set_name
    name = ""
    loop do
      puts "Howdy! What's your name?"
      name = gets.chomp
      break unless name.empty?
      puts "Sorry, you must type your name."
    end
    self.name = name
  end

  def choose
    choice = ""
    loop do
      display_player_choices
      choice = convert_choices(gets.chomp.downcase)
      break if MOVES.keys.include?(choice)
      puts "Invalid choice."
    end
    self.move = MOVES[choice]
    add_move
  end

  def display_player_choices
    puts "Choose one:"
    puts "-----------"
    puts "'ro' for 'rock'"
    puts "'pa' for 'paper'"
    puts "'sc' for 'scissors'"
    puts "'li' for 'lizard'"
    puts "'sp' for 'spock'"
    puts ""
  end

  def convert_choices(abbrv)
    case abbrv
    when 'ro' then 'rock'
    when 'pa' then 'paper'
    when 'sc' then 'scissors'
    when 'li' then 'lizard'
    when 'sp' then 'spock'
    end
  end
end

class Computer < Player
  def set_name
    self.name = ['Hal', 'Sonny', 'Chappie'].sample
  end

  def choose
    computer_move = MOVES.keys.sample
    self.move = MOVES[computer_move]
    add_move
  end
end

# Game Orchestration Engine
class RPSGame
  WIN_MATCH = 2

  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome
    welcome_message
    game_rules
    move_rules
  end

  def welcome_message
    clear_screen
    prompt "Welcome to Rock, Paper, Scissors, #{human.name}!"
    prompt "The first player to win #{WIN_MATCH} matches is the GRAND WINNER!"
  end

  def game_rules
    answer = ""
    loop do
      prompt "Would you like to see the rules of the game? (y or n)"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      prompt "Sorry, you must type y or n."
    end
    move_rules if answer == 'y'
    prompt "Let's play!"
    clear_screen
  end

  def move_rules
    clear_screen
    puts "RULES:"
    prompt "Rock crushes scissors and lizard."
    prompt "Paper covers rock and disproves spock."
    prompt "Scissors cuts paper and decapitates lizard."
    prompt "Lizard poisons spock and eats paper."
    prompt "Spock smashes scissors and vaporizes rock."
    sleep(7)
    clear_screen
  end

  def clear_screen
    system('clear') || system('cls')
  end

  def display_round(current_round)
    puts "ROUND: #{current_round}"
  end

  def display_current_score
    puts "#{human.name} - #{human.score} | #{computer.name} - #{computer.score}"
    puts ""
  end

  def players_choose_moves!
    human.choose
    computer.choose
  end

  def display_players_moves
    prompt "#{human.name} chose #{human.move}."
    prompt "#{computer.name} chose #{computer.move}."
  end

  def display_move_history
    prompt "#{human.name}'s moves:"
    puts human.move_history
    prompt "#{computer.name} moves:"
    puts computer.move_history
  end

  def display_round_winner
    if human.move > computer.move
      prompt "#{human.name} won this round!"
    elsif computer.move > human.move
      prompt "#{computer.name} won this round."
    else
      prompt "It's a tie!"
    end
  end

  def update_scores!
    if human.move > computer.move
      human.score += 1
    elsif computer.move > human.move
      computer.score += 1
    end
  end

  def match_over?
    human.score == WIN_MATCH || computer.score == WIN_MATCH
  end

  def display_grand_winner
    if human.score == WIN_MATCH
      puts "CONGRATULATIONS! You are the grand winner!!"
      puts ""
    elsif computer.score == WIN_MATCH
      prompt "#{computer.name} is the grand winner. Better luck next time!"
      puts ""
    end
  end

  def play_again?
    answer = ''
    loop do
      puts "Would you like to play again? (y for yes, n for no)."
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Sorry, please type either y or n."
    end
    return true if answer == 'y'
    false
  end

  def reset_scores
    human.score = 0
    computer.score = 0
  end

  def reset_move_history
    human.move_history = []
    computer.move_history = []
  end

  def display_goodbye_message
    prompt "Thanks for playing! Goodbye!"
  end

  def play_round
    display_current_score
    players_choose_moves!
    display_players_moves
    display_round_winner
    update_scores!
  end

  def play
    display_welcome
    sleep 2
    loop do
      current_round = 1
      reset_scores
      loop do
        display_round(current_round)
        play_round
        current_round += 1
        clear_screen
        break if match_over?
      end
      display_grand_winner
      display_move_history
      break if !play_again?
    end
  end
  display_goodbye_message
end

RPSGame.new.play
