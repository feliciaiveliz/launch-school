let myArray = [1, 2, 3, 4];
const myOtherArray = myArray;
myArray = myArray.slice();

myArray.pop();
console.log(myOtherArray); // [1, 2, 3, 4]

myArray = [1, 2];
console.log(myOtherArray); // [1, 2, 3, 4]

// or

for (let idx = 0; idx < myArray.length; i++) {
  myOtherArray.push(myArray[idx]);
}
