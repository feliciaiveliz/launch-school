let scores = [96, 47, 113, 89, 100, 102];

let count = 0

for (i = 0; i < scores.length; i++) {
  if (scores[i] >= 100) {
    count += 1;
  }
}

console.log(count);
