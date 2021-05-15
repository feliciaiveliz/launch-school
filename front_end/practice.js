// let count = [1, 2, 3];
// function pop(array) {
//   let result = array[array.length - 1];
//   array.length = array.length - 1;
//   return result;
// }

let count = [1, 2, 3];

let pop = array => {
  let result = array[array.length - 1];
  array.length = array.length - 1;
  return result;
};

console.log(pop(count));
console.log(count);
