WIN_MATCH = 5
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
VALID_ANSWERS = %w(1 2)
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "=> #{msg}"
end

def display_welcome_msg
  prompt "Welcome to Tic Tac Toe!"
  prompt "You must mark three squares in a single line to win the round."
  prompt "The first player to win #{WIN_MATCH} rounds is the GRAND CHAMPION!"
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

def display_round(current_round)
  prompt("ROUND: #{current_round}")
end

def who_plays_first
  answer = ''
  loop do
    prompt "Would you like to play first?"
    prompt "Type 1 for 'yes' or 2 for 'no'."
    answer = gets.chomp.downcase
    break if VALID_ANSWERS.include?(answer)
    prompt "That's not a valid choice."
  end
  answer == '1' ? 'player' : 'computer'
end

def place_piece!(brd, current_player) # WORK ON
  case current_player
  when 'player' then player_places_piece!(brd)
  when 'computer' then computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  current_player == 'player' ? 'computer' : 'player'
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

  square = computer_offense(brd, square) ||
           computer_defense(brd, square) ||
           center_square(brd) ||
           empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def center_square(brd)
  5 if empty_squares(brd).include?(5)
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
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won_round?(brd)
  !!detect_round_winner(brd)
end

def display_score(scores)
  prompt "SCORES: You #{scores[:player]} | Computer #{scores[:computer]}"
end

def update_scores!(brd, scores)
  if detect_round_winner(brd) == 'You'
    scores[:player] += 1
  elsif detect_round_winner(brd) == 'Computer'
    scores[:computer] += 1
  end
  scores
end

def display_winner(brd)
  if detect_round_winner(brd) == 'You'
    prompt "You won this round!"
  elsif detect_round_winner(brd) == 'Computer'
    prompt "Computer won this round."
  end
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

def announce_champion(scores)
  if player_won_game?(scores)
    prompt "CONGRATULATIONS! YOU ARE THE GRAND CHAMPION!"
  elsif computer_won_game?(scores)
    prompt "Computer is the winner. Better luck next time!"
  end
end

def play_again?
  prompt "Would you like to play again? ('y' for yes, 'n' for no)."
  answer = ''
  loop do
    answer = gets.chomp.downcase
    if answer == 'y' || answer == 'yes'
      clear_screen
      return true
    elsif answer == 'n'
      return false
    end
    prompt "That's not a valid choice."
  end
end

def clear_screen
  system('clear') || system('cls')
end

def sleep
  system 'sleep 4'
end

def display_goodbye_msg
  prompt "Thanks for playing Tic Tac Toe! Farewell!"
end

############## Main Code ################

loop do
  display_welcome_msg
  sleep
  clear_screen
  current_round = 1
  scores = { player: 0, computer: 0 }
  current_player = who_plays_first

  loop do
    board = initialize_board

    loop do
      display_board(board)
      display_round(current_round)
      display_score(scores)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won_round?(board) || board_full?(board)
    end

    display_board(board)
    if someone_won_round?(board)
      update_scores!(board, scores)
      display_winner(board)
    else
      prompt "It's a tie!"
    end
    sleep
    current_round += 1
    display_board(board)
    break if game_over?(scores)
  end
  announce_champion(scores)
  break unless play_again?
end

display_goodbye_msg
