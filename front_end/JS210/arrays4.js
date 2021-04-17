let family = ['Vinton', 'Felicia', 'Gian', 'BooBoo'];

function myFamily(list) {
  let result = '';

  for (let idx = 0; idx < family.length; idx++) {
    result += String(family[idx]);
  }

  return result;
}

console.log(myFamily(family));
