let names = ['Heather', 'Gisella', 'Katsuki', 'Hua', 'Katy', 'Kathleen', 'Otakar'];
let letters = names.map(name => name[0]);
// letters is [ "H", "G", "K", "H", "K", "K", "O" ]

// count the frequency of each letter

let counts = letters.reduce((obj, letter) => {
  obj[letter] = obj[letter] || 0;
  obj[letter] += 1;
  return obj;
}, {});

// Use reduce to find the highest occuring letter in object

let letter = Object.keys(counts).reduce((lastLetter, currentLetter) => {
  if (counts[lastLetter] > counts[currentLetter]) {
    return lastLetter;
  } else {
    return currentLetter;
  }
});

// letter is "K"
