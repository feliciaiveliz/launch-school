function acronym(string) {
  words = string.split(/[' ',-]/).filter(word => word !== '');
  return words.map(word => word[0].toUpperCase()).join('');
}

// or

function acronym(string) {
  let stringArray = string.replace(/-/g, ' ').split(' ');
  let initials = stringArray.map(word => word[0].toUpperCase());
  return initials.join('');
}

console.log(acronym('Portable Network Graphics'));                  // "PNG"
console.log(acronym('First In, First Out'));                        // "FIFO"
console.log(acronym('PHP: HyperText Preprocessor'));                // "PHP"
console.log(acronym('Complementary metal-oxide semiconductor'));    // "CMOS"
console.log(acronym('Hyper-text Markup Language'));                 // "HTML"
