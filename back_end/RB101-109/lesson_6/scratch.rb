MAX_SCORE = 21
MAX_ROUNDS = 2
DEALER_MAX_SCORE = 17
VALID_MOVES = ['h', 's']
SUITS = ['Hearts', 'Diamonds', 'Spades', 'Clubs']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

def clear_screen ##### GOOD
  (system 'clear') || (system 'cls')
end

def system_sleep ##### GOOD
  system 'sleep 5'
end

def prompt(msg) ##### GOOD 
  puts ">> #{msg}"
end

def display_welcome ##### GOOD
  prompt "Let's play a game of #{MAX_SCORE}. You will play against the Dealer."
  prompt "Each player will be dealt two cards and a chance to either hit or stay."
  prompt "Get as close to 21 without going over to win the round."
  prompt "The first player to win 5 rounds is the GRAND CHAMPION!"
end

def display_goodbye ##### GOOD
  prompt "Until Next Time! Farewell!"
end

def display_round(round) ##### GOOD
  prompt "ROUND: #{round}"
end

def display_scores(scores) ##### GOOD
  prompt "SCORES: You #{scores[:player]} | Dealer #{scores[:dealer]}"
  puts "---------------------------"
  puts ""
end

def initialize_deck ##### GOOD
  SUITS.product(VALUES).shuffle
end

def deal_hand!(deck) ##### GOOD
  hand = []
  2.times { hand << deck.pop }
  hand
end

def display_first_hand(dealer_cards, player_cards) ##### GOOD
  prompt "Dealer has: #{dealer_cards[0]} and [?]"
  prompt "Player has: #{player_cards[0]} and #{player_cards[1]} | TOTAL: #{total(player_cards)}"
end

def player_hit_or_stay? ##### GOOD
  player_choice = ''
  loop do 
    puts "Would you like to (h)it or (s)tay?"
    player_choice = gets.chomp.downcase
    break if VALID_MOVES.include?(player_choice)
    puts "Sorry, You must only enter 'h' or 's'."
  end
  player_choice
end

def player_hits!(deck, player_cards, player_choice) ##### GOOD
  if player_choice == 'h'
    prompt "You chose to hit!"
    player_cards << deck.pop
  end
  player_cards
end

def dealer_hit!(deck, dealer_cards) ##### GOOD
  dealer_cards << deck.pop
end

def display_player_cards(player_cards) ##### GOOD
  prompt "Your current cards: #{player_cards} | TOTAL: #{total(player_cards)}"
end

def display_dealer_turn ##### GOOD
  prompt "-----------------"
  prompt "Dealer hits!"
end

def display_dealer_hit(dealer_cards) ##### GOOD
  prompt "Dealer's current cards: #{dealer_cards} | TOTAL: #{total(dealer_cards)}"
end

def dealers_turn(dealer_cards, dealer_total)
  loop do
    display_dealer_turn 
    dealer_hit!(deck, dealer_cards)
    break if total(dealer_cards) >= DEALER_MAX_SCORE
    display_dealer_hit(dealer_cards)
  end
end

def total(cards) ##### GOOD
  values = cards.map { |card| card[1] }
  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > MAX_SCORE
  end
  sum
end

def busted?(cards) ##### GOOD
  total(cards) > MAX_SCORE
end

def display_dealer_busted(dealer_cards) ##### GOOD
  prompt "Dealer TOTAL: #{total(dealer_cards)}"
end

def display_compare_cards(dealer_cards, player_cards) ##### GOOD
  prompt "Dealer has #{dealer_cards} | TOTAL: #{total(dealer_cards)}"
  prompt "Player has #{player_cards} | TOTAL: #{total(player_cards)}"
  puts ""
end

# :tie, :dealer, :player, :dealer_busted, :player_busted
def detect_result(dealer_cards, player_cards) ##### GOOD
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > MAX_SCORE
    :player_busted
  elsif dealer_total > MAX_SCORE
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def who_won_round?(dealer_cards, player_cards) ##### GOOD
  result = detect_result(dealer_cards, player_cards)

  case result
  when :player_busted
    prompt "You busted! Dealer won this round."
  when :dealer_busted
    prompt "Dealer busted! You won this round!"
  when :player
    prompt "You won this round!"
  when :dealer
    prompt "Dealer won this round."
  when :tie
    prompt "It's a tie!"
  end
end

def update_scores!(scores, dealer_cards, player_cards)
  winner = detect_result(dealer_cards, player_cards) 
  
  if winner == :player_busted || winner == :dealer
    scores[:dealer] += 1
  elsif winner == :dealer_busted || winner == :player
    scores[:player] += 1
  else
    scores
  end
  scores
end

def game_over?(scores) ##### GOOD
  scores[:dealer] == MAX_ROUNDS || scores[:player] == MAX_ROUNDS
end

def announce_winner(scores)
  if scores[:dealer] == MAX_ROUNDS 
    prompt "Dealer is the Grand Champion. Better luck next time!" 
    puts "-------------------------------------------------------"
  elsif scores[:player] == MAX_ROUNDS
    prompt "YOU ARE THE GRAND CHAMPION!!"
    puts "------------------------------"
  end
end

def play_again?
  prompt "Would you like to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end


################## MAIN GAME ####################
#################################################


display_welcome
system_sleep
clear_screen

loop do
  round = 1
  scores = { dealer: 0, player: 0 }

  # GAME LOOP 
  loop do 
    display_round(round) # displays the current round
    display_scores(scores) # displays the current score
    
    loop do 
      # DEAL INITIAL HAND GOOOOODD
      deck = initialize_deck # shuffles cards
      dealer_cards = deal_hand!(deck) # deals cards to dealer
      player_cards = deal_hand!(deck) # deals cards to player
      display_first_hand(dealer_cards, player_cards) # displays initial hand

      # PLAYER TURN
      loop do # GOOOOOD
        player_choice = player_hit_or_stay?
        player_hits!(deck, player_cards, player_choice)
        display_player_cards(player_cards)
        break if player_choice == 's' || busted?(player_cards)
      end
    
      if busted?(player_cards) 
        who_won_round?(dealer_cards, player_cards)
        update_scores!(scores, dealer_cards, player_cards)
        system_sleep
        round += 1
        break
      end

      # DEALER TURN
      display_dealer_turn 
      break if total(dealer_cards) >= DEALER_MAX_SCORE
      dealer_hit!(deck, dealer_cards)
      display_dealer_hit(dealer_cards)

      if busted?(dealer_cards)
        who_won_round?(dealer_cards, player_cards)
        update_scores!(scores, dealer_cards, player_cards)
        system_sleep
        round += 1
        break
      else
        prompt "Dealer stays at #{total(dealer_cards)}"
      end

      # COMPARE CARDS
      display_compare_cards(dealer_cards, player_cards) # display cards
      update_scores!(scores, dealer_cards, player_cards)
      round += 1
      system_sleep 
    end

    clear_screen
    break if game_over?(scores)
  end

  announce_winner(scores)
  break unless play_again?
  clear_screen
end

display_goodbye