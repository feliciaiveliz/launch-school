function compareScores(score1, score2) {
  if (score1 < score2) {
    return -1;
  } else if (score1 > score2) {
    return 1;
  } else {
    return 0;
  }
}


let scores = [5, 88, 50, 9, 60, 99, 12, 23];
console.log(scores.sort(compareScores));            // [ 5, 9, 12, 23, 50, 60, 88, 99 ]
console.log(scores);                                // mutated to [ 5, 9, 12, 23, 50, 60, 88, 99 ]

function compareFunction(item1, item2) {
  if (item1 is less than item2 based on some comparison criterion) {
    return -1;
  } else if (item1 is greater than item2 based on some comparison criterion) {
    return 1;
  } else {  // item1 and item2 are equal
    return 0;
  }
}
