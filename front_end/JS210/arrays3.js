let pets = ['Gian', 'Anakin', 'Pumpkin', 'Steve', 'Gibbs'];

function myPets(list) {
  let result = [];

  for (let i = (list.length - 1); i >= 0; i--) {
    result.push(list[i]);
  }

  return result;
}

console.log(myPets(pets));
