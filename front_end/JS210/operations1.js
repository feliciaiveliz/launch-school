let count = [0, 1, 2];

function push(array, value) {
  array[array.length] = value;
  return array.length;
}

console.log(push(count, 3));
console.log(count);

// The array#push method is a destructive method that adds an element to the end of the array
