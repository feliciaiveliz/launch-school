VALID_CHOICES = %w(ro pa sc li sp)

WIN_CONDITIONS = { rock: ["lizard", "scissors"],
                   paper: ["rock", "spock"],
                   scissors: ["paper", "lizard"],
                   lizard: ["paper", "spock"],
                   spock: ["scissors", "rock"] }

WINNING_MATCHES = 5

def prompt(message)
  Kernel.puts("=> #{message}")
end

def display_welcome
  prompt <<-MSG
"Let's play a game of Rock, Paper, Scissors, Lizard, Spock! First player to win 5 rounds wins the entire match!"
MSG
end

def round(current_round)
  prompt("Round: #{current_round}")
end

def options
  prompt <<-MSG
  Please choose one:
   1. type 'ro' for 'rock'
   2. type 'pa' for 'paper'
   3. type 'sc' for 'scissors'
   4. type 'li' for 'lizard'
   5. type 'sp' for 'spock'
MSG
end

def convert_option(player)
  case player
  when 'ro' then 'rock'
  when 'pa' then 'paper'
  when 'sc' then 'scissors'
  when 'li' then 'lizard'
  when 'sp' then 'spock'
  end
end

def display_choices(player, computer)
  prompt("You chose: #{player}; Computer chose: #{computer}")
end

def player_win_round?(player, computer)
  WIN_CONDITIONS[player.to_sym].include?(computer)
end

def computer_win_round?(computer, player)
  WIN_CONDITIONS[computer.to_sym].include?(player)
end

def display_current_score(player, computer)
  prompt("Your score: #{player} || Computer score: #{computer}")
end

def display_winner(player_wins, computer_wins)
  if player_wins == WINNING_MATCHES
    puts "YOU ARE THE GRAND WINNER!"
  elsif computer_wins == WINNING_MATCHES
    puts "Computer won the round. Better luck next time."
  end
end

def match_over?(player_wins, computer_wins)
  player_wins == WINNING_MATCHES || computer_wins == WINNING_MATCHES
end

def play_again?(answer)
  prompt("Do you want to play again?")
  loop do
    answer = gets.chomp.downcase
    if answer.start_with? 'y'
      return true
    elsif answer.start_with? 'n'
      return false
    end
    prompt("Please only type y or n.")
  end
end

def clear_screen
  system('clear') || system('cls')
end

def goodbye_message
  prompt("Come back to play anytime. Farewell!")
end

# main code

prompt("Let's play a game of Rock, Paper, Scissors, Lizard, Spock! First player to win 5 rounds wins the entire match!")

loop do
  player_wins = 0
  computer_wins = 0
  current_round = 1
  answer = ''

  loop do
    player = ''
    loop do
      round(current_round)
      prompt(options)
      player = gets.chomp.downcase
      if VALID_CHOICES.include?(player)
        break
      else
        prompt("That's not a valid choice. Please type in the first two letters.")
      end
    end
    computer = VALID_CHOICES.sample
    player = convert_option(player)
    computer = convert_option(computer)
    current_round += 1
    display_choices(player, computer)
    if player_win_round?(player, computer)
      prompt("You won this round!")
      player_wins += 1
    elsif computer_win_round?(computer, player)
      prompt("The computer won this round.")
      computer_wins += 1
    else
      prompt("It's a tie!")
    end
    break if match_over?(player_wins, computer_wins)
    display_current_score(player_wins, computer_wins)
  end

  display_winner(player_wins, computer_wins)

  break unless play_again?(answer)
  clear_screen
end

goodbye_message
