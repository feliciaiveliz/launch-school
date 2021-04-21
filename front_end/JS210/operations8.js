function join(array, string) {
  let result = '';

  for (let i = 0; i < array.length; i++) {
    result += String(array[i]);

    if (i < array.length - 1) {
      result += string;
    }
  }

  return result;
}

console.log(join(['bri', 'tru', 'wha'], 'ck '));       // 'brick truck wha'
console.log(join([1, 2, 3], ' and '));                 // '1 and 2 and 3'
console.log(['bri', 'tru', 'wha'].join('ck '));
