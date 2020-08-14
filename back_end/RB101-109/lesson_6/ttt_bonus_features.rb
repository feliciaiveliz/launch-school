WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
FIRST_PLAYER = %w(p c)
VALID_ANSWERS = %w(p c ch)
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WIN_MATCH = 5

def prompt(msg)
  puts "=> #{msg}"
end

def display_welcome_msg
  prompt "Welcome to Tic Tac Toe!"
  prompt "The first player to win #{WIN_MATCH} rounds is the Champion!"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  clear_screen
  puts "=> You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "       |       |"
  puts "   #{brd[1]}   |   #{brd[2]}   |   #{brd[3]}"
  puts "       |       |"
  puts "-------+-------+-------"
  puts "       |       |"
  puts "   #{brd[4]}   |   #{brd[5]}   |   #{brd[6]}"
  puts "       |       |"
  puts "-------+-------+-------"
  puts "       |       |"
  puts "   #{brd[7]}   |   #{brd[8]}   |   #{brd[9]}"
  puts "       |       |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def round(current_round)
  prompt("Round: #{current_round}")
end

def who_plays_first
  answer = ''
  loop do
    prompt "Who plays first?"
    prompt "Type 'p' for player, 'c' for computer, or 'ch' for choose'."
    answer = gets.chomp.downcase
    break if VALID_ANSWERS.include?(answer)
    prompt "That's not a valid choice."
  end
  answer == 'p' ? 'p' : 'c'
end

def place_piece!(brd, current_player)
  case current_player
  when 'p' then player_places_piece!(brd)
  when 'c' then computer_places_piece!(brd)
  else FIRST_PLAYER.sample
  end
end

def alternate_player(current_player)
  current_player == 'p' ? 'c' : 'p'
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square to place a piece: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_offense(brd, square)
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end
  square
end

def computer_defense(brd, square)
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, PLAYER_MARKER)
    break if square
  end
  square
end

def computer_places_piece!(brd)
  square = nil

  square = computer_offense(brd, square)
  square = computer_defense(brd, square) if !square
  square = 5 if empty_squares(brd).include?(5) && !square
  square = empty_squares(brd).sample if !square
  brd[square] = COMPUTER_MARKER
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

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
    nil
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won_round?(brd)
  !!detect_round_winner(brd)
end

def display_score(scores)
  prompt "Your score: #{scores[:player]} | Computer score: #{scores[:computer]}"
end

def update_scores!(brd, scores)
  if detect_round_winner(brd) == 'You'
    scores[:player] += 1
    prompt "You won this round!"
  elsif detect_round_winner(brd) == 'Computer'
    scores[:computer] += 1
    prompt "Computer won this time."
  end
  scores
end

def detect_round_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'You'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def player_won_game?(scores)
  scores[:player] == WIN_MATCH
end

def computer_won_game?(scores)
  scores[:computer] == WIN_MATCH
end

def game_over?(scores)
  scores[:player] == WIN_MATCH || scores[:computer] == WIN_MATCH
end

def announce_grand_winner(scores)
  if player_won_game?(scores)
    prompt "CONGRATULATIONS! YOU ARE THE GRAND CHAMPION!"
  elsif computer_won_game?(scores)
    prompt "Computer is the winner. Better luck next time!"
  end
end

def play_again?(player_play_again)
  prompt "Would you like to play again? ('y' for yes, any other key for 'no')"
  player_play_again = ''
  loop do
    player_play_again = gets.chomp.downcase
    if (player_play_again.start_with? 'y') || (player_play_again == 'yes')
      clear_screen
      return true
    elsif player_play_again == 'n'
      return false
    end
    prompt "That's not a valid choice."
  end
end

def clear_screen
  system('clear') || system('cls')
end

def sleep
  system 'sleep 3'
end

def display_goodbye_msg
  prompt "Thanks for playing Tic Tac Toe! Farewell!"
end

# Main Code

loop do
  display_welcome_msg
  sleep
  clear_screen
  current_round = 1
  scores = { player: 0, computer: 0 }
  current_player = who_plays_first
  player_play_again = ''

  loop do
    board = initialize_board

    loop do
      display_board(board)
      round(current_round)
      display_score(scores)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won_round?(board) || board_full?(board)
    end

    if someone_won_round?(board)
      update_scores!(board, scores)
    else
      prompt "It's a tie!"
    end
    sleep

    current_round += 1
    display_board(board)
    break if game_over?(scores)
  end
  announce_grand_winner(scores)
  break unless play_again?(player_play_again)
end

display_goodbye_msg
