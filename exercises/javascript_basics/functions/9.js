function extractLanguage(locale) {
  return locale.slice(0, 2);
}

// or

function extractLanguage(locale) {
  return locale.split('_')[0];
}

console.log(extractLanguage('en_US.UTF-8'));  // 'en'
console.log(extractLanguage('en_GB.UTF-8'));  // 'en'
console.log(extractLanguage('ko_KR.UTF-16')); // 'ko'
