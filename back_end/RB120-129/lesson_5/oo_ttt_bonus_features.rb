module Extras
  def prompt(msg)
    puts ">> #{msg}"
  end

  def clear
    system('clear') || system('cls')
  end
end

class Board
  include Extras

  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]] # diagonals
  def initialize
    @squares = {}
    reset
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize

  def []=(number, marker)
    @squares[number].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  # return winner marker or nil
  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end
  
  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).map(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  include Extras

  attr_accessor :name, :marker, :human, :score, :first_player

  def initialize
    set_name
    @score = 0
  end
end

class Human < Player
  def initialize
    super
    choose_marker
  end

  def set_name
    name = ""
    loop do
      puts "Howdy! What's your name?"
      name = gets.chomp.capitalize
      break unless name.strip.empty?
      puts "Sorry, you must type your name."
    end
    self.name = name
  end

  def choose_marker
    marker = ""
    loop do
      puts "Which marker would you like? Type 'x' or 'o'."
      marker = gets.chomp.upcase
      break unless marker.strip.empty? || !(%w(X O)).include?(marker)
      puts "Sorry, you must type 'x' or 'o'."
    end
    self.marker = marker
  end

  def choose_first_player
    choice = ""
    loop do
      prompt "Who would you like to play first?"
      prompt "Type 'p' for player, 'c' for computer, or 'r' for random."
      choice = gets.chomp.downcase
      break unless choice.strip.empty? || !(%w(p c r)).include?(choice)
      puts "That's not a valid choice. You must type 'p', 'c' or 'r'."
    end
    @first_player = choice
  end
end

class Computer < Player
  def set_name
    self.name = %w(R2D2 Pinky Sif Lucy UB40).sample
  end

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end
end

class TTTGame
  include Extras

  WIN_GAME = 2

  attr_reader :board, :human, :computer, :marker
  attr_accessor :score

  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
  end

  def play
    display_welcome_message
    set_markers

    loop do
      clear
      play_game
      break unless play_again?
      reset
      reset_scores
      display_play_again_message
    end
    display_goodbye_message
  end

  private

  def display_welcome_message
    clear
    prompt "Welcome to Tic Tac Toe, #{human.name}!"
    prompt "You will play against #{computer.name}."
    prompt "Win 5 rounds to be the GRAND CHAMPION!"
    prompt "Let's play!"
    sleep 3
    clear
  end

  def set_markers
    if human.marker == "X" then computer.marker = "O"
    elsif human.marker == "O" then computer.marker = "X"
    end
  end

  def joinor(arr, delimiter=', ', word='or')
    case arr.size
    when 0 then ''
    when 1 then arr.first
    when 2 then arr.join(" #{word} ")
    else
      arr[-1] = "#{word} #{arr.last}"
      arr.join(delimiter)
    end
  end

  def display_board_and_scores
    puts "You're #{human.marker}. #{computer.name} is #{computer.marker}."
    puts ""
    board.draw
    puts ""
    display_scores
  end

  def clear_screen_and_display_board
    clear
    display_board_and_scores
  end

  def display_round(current_round)
    puts "ROUND: #{current_round}"
  end

  def display_scores
    puts "#{human.name} - #{human.score} | #{computer.name} - #{computer.score}"
    puts ""
  end
  
  def play_game
    loop do 
      play_round
      break if game_over?
    end
    announce_champion
  end

  def play_round
    current_round = 1
    loop do
      clear
      display_round(current_round)
      display_board_and_scores
      current_player_moves

      if round_over?
        display_round_winner
        update_scores!
        current_round += 1
        reset
        clear
        break
      end
      clear_screen_and_display_board if human_turn?
    end
  end

  def human_turn?
    @current_marker == human.marker
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = computer.marker
    else
      computer_moves
      @current_marker = human.marker
    end
  end

  def human_moves
    prompt "Choose a square (#{joinor(board.unmarked_keys)})"
    square = ""
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      prompt "Invalid choice."
    end
    board[square] = human.marker
  end

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end

  def determine_round_winner
    case board.winning_marker
    when human.marker 
      'human'
    when computer.marker
      'computer'
    end
  end
  
  def display_round_winner
    if determine_round_winner == 'human'
      prompt "#{human.name} won this round!"
      sleep 3
    elsif determine_round_winner == 'computer'
      prompt "#{computer.name} won this round."
      sleep 3
    else
      prompt "It's a tie!"
      sleep 3
    end
  end

  def update_scores!
    if determine_round_winner == 'human'
      human.score += 1
    elsif determine_round_winner == 'computer'
      computer.score += 1
    end
  end

  def round_over?
    board.someone_won? || board.full?
  end

  def game_over?
    human.score == WIN_GAME || computer.score == WIN_GAME
  end

  def announce_champion
    clear
    if human.score == WIN_GAME
      puts "#{human.name} is the grand winner! CONGRATULATIONS!"
      puts ""
    elsif computer.score == WIN_GAME
      puts "#{computer.name} is the grand winner. Better luck next time!"
      puts ""
    end
  end

  def play_again?
    answer = ""
    loop do
      prompt "Would you like to play again? (y or n)."
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      prompt "Invalid response."
    end
    answer == 'y'
  end

  def display_play_again_message
    prompt "Let's play again!"
    puts ""
  end

  def reset_scores
    human.score = 0
    computer.score = 0
  end

  def reset
    board.reset
    # @current_marker = FIRST_TO_MOVE
    clear
  end

  def display_goodbye_message
    prompt "Thanks for playing! Goodbye!"
  end
end

TTTGame.new.play
