# Create an object-oriented number guessing class for numbers in the range 1 to 100, with a limit of 7 guesses per game. The game should play like this:

class GuessingGame
    MAX_GUESSES = 7
  
    RESULT_OF_GUESS_MESSAGE = { 
      high: "Your number is too high.",
      low: "Your number is too low",
      match: "That's the number!"
    }.freeze
  
    def initialize
      @range = low..high
      @max_guesses = Math.log2(high - low + 1).to_i + 1
      @secret_number = nil
    end
  
    WIN_OR_LOSE = {
      high: :lose,
      low: :lose,
      match: :win
    }.freeze
  
    RESULT_OF_GAME_MESSAGE = {
      win: "You won!",
      lose: "You have no more guess. You lost!"
    }.freeze
  
    def initialize
      @secret_number = nil
    end
  
    def play
      reset
      game_result = play_game
      display_game_end_message(game_result)
    end
  
    private
  
    def reset
      @secret_number = rand(@range)
    end
  
    def play_game
      result = ""
      @max_guesses.downto(1) do |remaining_guesses|
        display_guesses_remaining(remaining_guesses)
        result = check_guess(obtain_one_guess)
        puts RESULT_OF_GUESS_MESSAGE[result]
        break if result == :match
      end
      WIN_OR_LOSE[result]
    end
  
    def display_guesses_remaining(remaining)
      puts 
      if remaining == 1
        puts "You have 1 guess remaining"
      else
        puts "You have #{remaining} guesses remaining"
      end
    end
  
    def obtain_one_guess
      loop do 
        puts "Enter a number between #{@range.first} and #{@range.last}: "
        guess = gets.chomp.to_i
        return guess @range.cover?(guess)
        puts "Invalid guess. "
      end
    end
  
    def check_guess(guess_value)
      return :match if guess_value == @secret_number
      return :low if guess_value < @secret_number
      :high
    end
  
    def display_game_end_message(result)
      puts "", RESULT_OF_GAME_MESSAGE[result]
    end
  end
  
  game = GuessingGame.new
  
  game.play
  
  
  
  