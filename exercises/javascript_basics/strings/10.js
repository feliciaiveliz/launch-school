let string = 'launch school tech & talk';
let words = string.split(' ');
let capitalizeWords = [];

for (let i = 0; i < words.length; i++) {
  let word = words[i];

  capitalizeWords.push(word[0].toUpperCase() + word.slice(1));
}

capitalizeWords.join(' ');
