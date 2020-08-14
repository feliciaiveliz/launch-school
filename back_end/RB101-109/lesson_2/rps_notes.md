 # Rock, Paper, Scissors, Lizard, Spock Bonus Features
1. In addition to the normal rock, paper, scissors game, we need to incorporate two options: Lizard and Spock. 
2. Update program so that user can type 'r' for 'rock', 'p' for 'paper', etc. There will be two 's', resolve it. 
3. Keep track of player's and computer's score. When either one reaches 5 wins, end the match. 


Inputs: 
  * user will type 
    * 'r', or 'rock', 'p', or 'paper', 's', 'scissors', 'l', or 'lizard', or 'sp', or 'spock'
    * use these values in an array or hash
    * key = user value, value = nested array of two values- user/computer for winning conditions
  * user will input 'y' or 'yes' to replay or 'n' or 'no' to end game
Outputs: 
  * Welcome message
  * Display message to user that the first who reaches 5 winning matches will win game
  * Update player of score. 
  * Display message that says "You won 5 matches! You're the grand winner!" or "The computer won 5 matches. You lost."

Requirements:
1. Give user option to type first(and second) letter of option name
2. Display to user score between them and the computer
3. Let user know if they have won or lost
4. Ask user if they want to continue, then clear the screen and start over.
5. Clear the screen after each round.
6. r > l, r > sc
7. p > r, p > sp
8. sc > p, sc > l
9. l > p, l > sp 
10. sp > sc, sp > r

Examples/Test Cases:

player = r and computer = l or sc => "You win!"
player = p and computer = r or sp => "You win!"
player = sc and computer = p or l => "You win!"
player = l and computer = p or sp  => "You win!"
player = sp and computer = sc or r => "You win!"

computer = r and player = l or sc => "Computer wins!"
computer = p and player = r or sp => "Computer wins!"
computer = sc and player = p or l => "Computer wins!"
computer = l and player = p or sp => "Computer wins!"
computer = sp and player = sc or r => "Computer wins!"

Data Structure:
 * hash
   * { key: [value1, value2],
       key: [value 1, value2]
     }
 * array 
   * %w(r, p, sc, l, sp)
 * case statement for choices
 * 
Things to Implement:
1. Clear screen after each round and after entire game
2. Label round: "Round 1! You chose: rock, Computer chose: paper" "Computer wins this round!"
3. Allow for case sensitivity


What methods do I need?
1. generic prompt message for messages- prompt
2. method for validating user answer- no space or empty answers, no numbers and downcase- players_choice
3. display_results- 
4. display_winner-
5. valid_choice- no spaces, no empty answers, no numbers
6. validate_choice-
7. correct_choice- only choices that come from %w(r p sc l sp)