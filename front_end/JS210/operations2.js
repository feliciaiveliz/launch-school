let array = [1, 2, 3];

const pop = array => {
  if (array.length === 0) {
    return undefined;
  }

  let newLength = array.length - 1;
  let value = array[newLength];
  array.length = newLength;
  return value;
};

console.log(pop(array));
console.log(array);
