let i = 1;

while (i <= 99) {
  console.log(i);
  i += 2;
}

// or

for (let i = 1; i < 100; i += 2) {
  console.log(i);
}

// or

let i = 1;

do {
  console.log(i);
  i += 2;
} while (i < 100);
