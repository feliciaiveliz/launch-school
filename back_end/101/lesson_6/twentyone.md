Start with 52 card deck consisting of 4 suits- hearts, diamonds, clubs and spades
13 values- 2, 3, 4, 5, 6, 7, 8, 9, 10, jack, queen, king, ace
Get as close to 21 as possible without going over. If you go over, it's a 'bust' and you lose.
There is a dealer and a player, each both dealt 2 cards. Player can see their cards but can only see 1 of players cards
2-10 face value, jack, queen, king- 10, ace- 1 or 11

**Different Scenarios**
1.
Dealer has: Ace and an unknown card
You have: 2 and 8

You should 'hit' in this scenario. The dealer has an ace, which means they have a high probability of having a 21. 
There's no way you can bust because even if you were dealt an ace, which will be 11, you will reach 21 and win the game

2.
Dealer has: 7 and unknown card
You have: 10 and 7

You should 'stay' here because there's a good chance that the unknown card is not an ace. If it were, you'd lose.
You will most likely win with 17 or a tie. 

3. 
Dealer has: 5 and unknown card
You have: Jack and 6

You should probably 'stay' to hope that the dealer busts.

**High Level Pseudocode**

1. Initialize deck
2. Deal cards to player and dealer
3. Player turn: hit or stay
   - repeat until bust or 'stay'
4. If player bust, dealer wins
5. Dealer turn: hit or stay
   - repeat until total >= 17
6. If dealer bust, player wins
7. Compare cards and declare winner
 
Getting Started

1. Figure out data structure to contain the 'deck' and the 'player's cards' and 'dealers card's'
- Hash and array
- suits = {jack: 10, queen: 10, king: 10} 
- face_cards = [2, 3, 4, 5, 6, 7, 8, 9, 10]
- ace = 1 (add nothing or 1 depending sum of current deck)
- [['H', '2'],  ['S', 'J'], ['D', 'A']]

2. Calculating Aces

```ruby
def total(cards)
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

  # correct for Aces
  values.select { |value| value == 'A' }.count.times do 
    sum -= 10 if sum > 21
  end

  sum 
end
```

3. Player turn. Use a loop to keep asking player if they want to hit or stay

- ask 'hit' or 'stay'
- if 'stay', stop asking
- otherwise, go to first 

```ruby
loop do 
  puts "hit or stay?"
  answer = gets.chomp
  break if answer == 'stay' || busted? # busted? method is not shown
end

if busted?
  # probably end the game? or ask the user to play again?
else
  puts "You chose to stay!" # if player didn't bust, must have stayed to get here
end

# continue on to Dealer turn
```

4. Dealer turn will follow a similar pattern as the player turn. The dealer's break condition will occur at the top of the 'hit or stay' loop. 
- This might be because if the dealer's second card is turned over and card total comes out to 21, then the dealer busts immediately and the game is over, the player won.

5. Two methods to calculate total and returns result of game
- def calculate_card_total
- def display_winner

 