const array1 = ['Moe', 'Larry', 'Curly', 'Shemp', 'Harpo', 'Chico', 'Groucho', 'Zeppo'];
const array2 = array1;

// for (let i = 0; i < array1.length; i += 1) {
//   array2.push(array1[i]);
// }

for (let i = 0; i < array1.length; i += 1) {
  if (array1[i].startsWith('C')) {
    array1[i] = array1[i].toUpperCase();
  }
}

console.log(array2);

// ['Moe', 'Larry', 'Curly', 'Shemp', 'Harpo', 'Chico', 'Groucho', 'Zeppo'];

// To have the changes reflected, we could assign array2 to array1;
// these two variables would then be pointing to and referencing the same array
