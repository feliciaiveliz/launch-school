const myArray = [5, 5];
myArray[-1] = 5;
myArray[-2] = 5;

function average(array) {
  let sum = 0;

  for (let key in array) {
    sum += array[key];
  }

  return sum / Object.keys(array).length;
}

console.log(average(myArray));
