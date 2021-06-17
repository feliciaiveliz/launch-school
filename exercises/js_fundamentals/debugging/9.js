const totalPages = 364;
let energy = 100;
let currentPage = 1; // move this declaration and assignment out of the function, so that 'currentPage' isn't reset to 1 on each iteration.

function read() {

  while (energy > 0 && currentPage < totalPages) {
    currentPage += 1;
    energy -= (5 + (currentPage * 0.1)); 
  }

  console.log(`Made it to page ${String(currentPage)}.`); // 2

  // Drink a cup of coffee.
  energy = 100;

  // Continue reading.
  if (currentPage < totalPages) {
    read();
  } else {
    console.log('Done!');
  }
}

read();
