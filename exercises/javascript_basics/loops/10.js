// Difference between the two:

let counter = 0;

while (counter > 0) {
  console.log('Woooot!');
  counter -= 1;
}

let counter = 0;

do {
  console.log('Woooot!');
  counter -= 1;
} while (counter > 0);

// The while loop check a condition before it enters a loop
// In a do/while loop, the condition is checked at the end of an iteration, guaranteeing that it will loop at least once
