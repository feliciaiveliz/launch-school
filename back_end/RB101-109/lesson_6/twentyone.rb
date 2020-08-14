MAX_POINTS = 2
MAX_TOTAL = 21
PLAYER_OPTIONS = %w(h s)
SUITS = ['H', 'D', 'S', 'C']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

def clear_screen # GOOD
  (system 'clear') || (system 'cls')
end

def sleep # GOOD
  system 'sleep 5'
end

def prompt(msg) # GOOD 
  puts ">> #{msg}"
end

def initialize_deck # GOOD
  SUITS.product(VALUES).shuffle
end

def display_welcome_msg # FIX LATER
  prompt "Welcome to Twenty-One!"
  prompt "Hit to draw a new card, or stay to keep the cards you have."
  prompt "The first player to get as close to 21 as possible wins the game."
  prompt "Whoever wins #{MAX_POINTS} rounds is the CHAMPION!"
end

def display_round(round) # GOOD
  prompt "ROUND: #{round}"
end

def display_scores(scores) # GOOD
  prompt "SCORES: You #{scores[:player]} | Dealer #{scores[:dealer]}"
  prompt "------------------------"
end

def display_initial_hand(dealer_cards, player_cards)
  prompt "Dealer has: #{dealer_cards[0]} and ?"
  prompt "Player has: #{player_cards[0]} and #{player_cards[1]}, for a total of #{card_total(player_cards)}."
  prompt "----------------------------------"
end


def create_hand(deck)
   hand = []
   hand << deck.pop(2)
   hand
end

def player_hit_or_stay?(player_turn)
  player_turn = nil
  loop do 
    prompt "Would you like to (h)it or (s)tay?"
    player_turn = gets.chomp.downcase
    break if PLAYER_OPTIONS.include?(player_turn)
    prompt "Sorry, must enter 'h' or 's'."
  end
end

def player_hit!(player_cards, deck)
  player_cards << deck.pop
end

def display_player_hit(player_cards, player_total)
  prompt "You chose to hit!"
  prompt "Your cards are now: #{player_cards}"
  prompt "Your total is now: #{player_total}"
end

def dealer_hit!(dealer_cards, deck)
  dealer_cards << deck.pop
end

def display_dealer_hit(dealer_cards, dealer_total)
  prompt "Dealer turn..."

  loop do 
    break if total(dealer_cards) >= 17
    prompt "Dealer hits!"
    dealer_hit!(dealer_cards, deck)
    prompt "Dealer's cards are now: #{dealer_cards}"
  end
end

def display_dealer_total
  prompt "Dealer total is now: #{card_total(dealer_cards)}"
end

def card_total(cards) # FIX LATER
  # cards = [['H', '3'], ['S', 'Q'], ...]
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0 # j, q, k
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for aces

  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > MAX_TOTAL
  end

  sum
end

def busted?(cards) # FIX LATER
  card_total(cards) > MAX_TOTAL
end

# :tie, :dealer, :player, :dealer_busted, :player_busted
def detect_result(player_total, dealer_total) # FIX LATER
  player_total = card_total(player_cards)
  dealer_total = card_total(dealer_cards)

  if player_total > MAX_TOTAL
    :player_busted
  elsif dealer_total > MAX_TOTAL
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(dealer_total, player_total) # FIX LATER
  result = detect_result(dealer_cards, player_cards)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def compare_totals(player_cards, dealer_cards, player_total, dealer_total)
  puts "=============="
  prompt "Dealer has #{dealer_cards}, for a total of: #{card_total(dealer_cards)}"
  prompt "Player has #{player_cards}, for a total of: #{card_total(player_cards)}"
  puts "=============="
end

def game_over?(scores)
  scores[:dealer] == MAX_POINTS || scores[:player] == MAX_POINTS
end

def play_again?  # GOOD
  puts "-------------"
  prompt "Would you like to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def display_goodbye_msg # GOOD
  prompt "Thanks for playing Twenty-One! Farewell!"
end

################ Main Code #################


display_welcome_msg # GOOD

loop do
  sleep # GOOD
  clear_screen # GOOD
  round = 1  # GOOD
  scores = {player: 0, dealer: 0} # GOOD

    loop do 
      deck = initialize_deck

      display_round(round)
      display_scores(scores)

      player_cards = create_hand(deck)
      dealer_cards = create_hand(deck)

      display_initial_hand(dealer_cards, player_cards)

      player_hit_or_stay?(player_turn)

      if player_turn == 'h' # FIXED             
        player_hit!(player_cards, deck)
        display_player_hit(player_cards, player_total)
      end

      break if player_turn == 's' || busted?(player_cards)
    end

    if busted?(player_cards)
      display_result(dealer_cards, player_cards)
      current_round += 1
      play_again? ? next : break # break out of entire loop
    else
      prompt "You stayed at #{player_cards}"
    end

    display_dealer_hit(dealer_cards, deck)

    if busted?(dealer_cards)
      display_dealer_total
      display_result(dealer_cards, player_cards)
      current_round += 1
      play_again? ? next : break
    else
      prompt "Dealer stays at #{dealer_total}"
    end

  compare_totals(dealer_cards, player_cards)
  display_result(dealer_cards, player_cards)
  break unless play_again?
end


  display_goodbye_msg
