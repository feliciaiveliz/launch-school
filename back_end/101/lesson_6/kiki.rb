require 'io/console'

# CONSTANTS
SUITS = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10'] +
         ['Jack', 'Queen', 'King', 'Ace']
FACE_CARDS = ['Jack', 'Queen', 'King']
BLACKJACK = 21
DEALER_MAX = 17
ROUNDS_TO_WIN = 5
PAUSE_TIME = 1
VALID_STAY = %w(stay s st sta)
VALID_HIT = %w(h hi hit)
VALID_ANSWERS = %w(y n)

# METHODS
def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system('clear') || system('cls')
end

def pause
  sleep PAUSE_TIME
end

def print_divider_space
  puts "=================================================="
  puts ''
end

def display_welcome_message
  prompt "Welecome to the game #{BLACKJACK}."
  prompt "The object is to get closest to #{BLACKJACK} without busting!"
  prompt "Aces: 1 or 11; Face Cards: 10; Other Cards: numerical value "
  prompt "First to win #{ROUNDS_TO_WIN} games wins the match!"
  print_divider_space
end

def print_shuffle_cards
  prompt "Shuffling cards..."
  puts ''
  pause
end

def initialize_full_deck
  deck = []
  SUITS.each do |suit|
    VALUES.each do |value|
      deck << { suit: suit, value: value }
    end
  end
  deck.shuffle
end

def deal_initial_hand!(cards)
  hand = []
  2.times do
    hand << cards.pop
  end
  hand
end

def valid_integer?(number)
  number.to_i.to_s == number
end

def hand_total(cards)
  total = 0
  cards.each do |card|
    if valid_integer?(card[:value])
      total += card[:value].to_i
    elsif FACE_CARDS.include?(card[:value])
      total += 10
    elsif card[:value] == 'Ace'
      total += 11
    end
    total
  end
  ace_correction(cards, total)
end

def ace_correction(cards, total)
  cards.select { |card| card[:value] == 'Ace' }.count.times do
    total -= 10 if total > BLACKJACK
  end
  total
end

def display_initial_hands(p_cards, d_cards, p_total)
  prompt "Dealer has: #{d_cards[0][:value]} of #{d_cards[0][:suit]}" \
         " and unknown card."
  prompt "You have: #{join_and(p_cards)}"
  prompt "Current total: #{p_total}"
  puts ''
end

def busted?(total)
  total > BLACKJACK
end

def ask_hit_or_stay
  answer = ''
  loop do
    puts "Would you like to hit or stay (h/s)?"
    answer = gets.chomp.downcase
    break if VALID_HIT.include?(answer) || VALID_STAY.include?(answer)
    puts "That is not a valid play. You must enter hit (h) or stay (s)."
  end
  answer
end

def play_hit!(cards, p_cards, p_choice)
  if VALID_HIT.include?(p_choice)
    prompt "You chose to hit."
    p_cards << cards.pop
  end
  p_cards
end

def turn_over?(choice, total)
  busted?(total) || VALID_STAY.include?(choice) || total == BLACKJACK
end

def play_players_turn!(cards, p_cards, p_total)
  loop do
    p_choice = ask_hit_or_stay
    p_cards = play_hit!(cards, p_cards, p_choice)
    p_total = hand_total(p_cards)
    break if turn_over?(p_choice, p_total)
    display_players_hand(p_cards, p_total)
    print_divider_space
  end
  p_total
end

def display_player_end_of_turn(p_total, p_cards)
  if busted?(p_total)
    prompt "You drew a #{p_cards[-1][:value]} of #{p_cards[-1][:suit]}" \
           " and busted with a total of #{p_total}!"
    prompt "The dealer wins!"
  elsif p_total == BLACKJACK
    prompt "You have #{BLACKJACK}. Blackjack!"
  else
    prompt "You stayed at #{p_total}"
  end
  print_divider_space
end

def continue_game
  print "Press any key to continue."
  STDIN.getch
end

def ask_player_continue
  loop do
    print_divider_space
    break if continue_game
  end
end

def join_and(current_cards)
  output = current_cards.map { |card| ["#{card[:value]} of #{card[:suit]}"] }
  case current_cards.size
  when 2 then output.join(' and ')
  else
    output[0..-2].join(', ').to_s + ", and #{output[-1][0]}"
  end
end

def display_players_hand(p_cards, p_total)
  prompt "Your cards are:"
  prompt join_and(p_cards).to_s
  prompt "Current total: #{p_total}"
end

def print_dealer_start
  prompt "Now it's the dealer's turn..."
  pause
end

def display_dealers_hand(d_cards)
  prompt "The dealer's cards are:"
  prompt join_and(d_cards).to_s
end

def print_dealer_hit
  puts ''
  prompt "Dealer hits..."
  pause
end

def play_dealers_turn!(cards, d_cards, d_total)
  loop do
    display_dealers_hand(d_cards)
    break if d_total >= DEALER_MAX
    print_dealer_hit
    d_cards << cards.pop
    d_total = hand_total(d_cards)
  end
  d_total
end

def display_dealer_end_of_turn(d_total)
  if busted?(d_total)
    prompt "The dealer busted with a total of #{d_total}! You win!"
  elsif d_total == BLACKJACK
    prompt "Dealer has #{BLACKJACK}! Blackjack!"
  else
    prompt "The dealer stays at #{d_total}."
  end
  print_divider_space
end

def calculate_result(d_cards, p_cards)
  p_total = hand_total(p_cards)
  d_total = hand_total(d_cards)
  if p_total > d_total
    :player
  elsif p_total < d_total
    :dealer
  elsif p_total == d_total
    :tie
  end
end

def update_wins!(result, wins)
  case result
  when :player
    wins[:player] += 1
  when :dealer
    wins[:dealer] += 1
  end
  wins
end

def display_result(result)
  case result
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def grand_winner?(wins)
  wins[:player] == ROUNDS_TO_WIN || wins[:dealer] == ROUNDS_TO_WIN
end

def display_wins(wins)
  prompt "You: #{wins[:player]} win(s) v. Dealer: #{wins[:dealer]} win(s)"
  print_divider_space
end

def game_end_sequence(wins)
  display_wins(wins)
  ask_player_continue
  clear_screen
end

def display_grand_winner(wins)
  if wins[:player] == ROUNDS_TO_WIN
    prompt "You beat the house #{wins[:player]} to #{wins[:dealer]}!"
    prompt "Time to go pro!"
    print_divider_space
  elsif wins[:dealer] == ROUNDS_TO_WIN
    prompt "House wins #{wins[:dealer]} to #{wins[:player]}!"
    prompt "Better spend your money elsewhere."
    print_divider_space
  end
end

def ask_play_again
  answer = ''
  loop do
    prompt "Play again? ('y' or 'n')"
    answer = gets.chomp.downcase
    break if VALID_ANSWERS.include?(answer)
    prompt "That is not a valid response."
  end
  answer
end

def play_again?(answer)
  answer == 'y'
end

def display_goodbye_message
  prompt "Thanks for playing #{BLACKJACK}! Goodbye!"
end

# MAIN CODE
clear_screen
display_welcome_message

loop do
  wins = { player: 0, dealer: 0 }

  loop do
    display_wins(wins)
    print_shuffle_cards
    cards = initialize_full_deck

    dealer_cards = deal_initial_hand!(cards)
    dealer_total = hand_total(dealer_cards)
    player_cards = deal_initial_hand!(cards)
    player_total = hand_total(player_cards)
    display_initial_hands(player_cards, dealer_cards, player_total)

    # Player's Turn
    player_total = play_players_turn!(cards, player_cards, player_total)
    display_player_end_of_turn(player_total, player_cards)

    if busted?(player_total)
      wins = update_wins!(:dealer, wins)
      game_end_sequence(wins)
      grand_winner?(wins) ? break : next
    end

    # Dealer's Turn
    print_dealer_start
    dealer_total = play_dealers_turn!(cards, dealer_cards, dealer_total)
    display_dealer_end_of_turn(dealer_total)

    if busted?(dealer_total)
      wins = update_wins!(:player, wins)
      game_end_sequence(wins)
      grand_winner?(wins) ? break : next
    end

    # Compare Hands
    result = calculate_result(dealer_cards, player_cards)
    display_result(result)
    wins = update_wins!(result, wins)
    game_end_sequence(wins)
    break if grand_winner?(wins)
  end

  display_grand_winner(wins)
  answer = ask_play_again
  break unless play_again?(answer)
  clear_screen
end

display_goodbye_message