function placeABet(guess) {
  function generateRandomInt() { // remove the parentheses around the function expression to turn it into a function declaration.
    return Math.floor(Math.random() * 25) + 1; // function expressions are usually anonymous and if they are given a name, it is only available within the function.
  };

  const winningNumber = generateRandomInt();

  if (guess < 1 || guess > 25) {
    return 'Invalid guess. Valid guesses are between 1 and 25.';
  }

  if (guess === winningNumber) {
    return "Congratulations, you win!";
  } else {
    return "Wrong-o! You lose.";
  }
}

const userGuess = parseInt(prompt('Input a guess between 1-25'), 10);
alert(placeABet(userGuess));
