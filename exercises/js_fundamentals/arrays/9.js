function oddities(array) {
  const oddElements = [];

  for (let i = 0; i < array.length; i += 2) {
    oddElements.push(array[i]);
  }

  return oddElements;
}

oddities([2, 3, 4, 5, 6]) === [2, 4, 6];      // false
oddities(['abc', 'def']) === ['abc'];         // false

// The reason why it is returned false on both invocations is because we are attempting to compare two different arrays that have the same values with '==='.
// The '===' operator only returns true if both array objects are actually just the same object in memory.
// Even if they have the same values, they are not the same object.
