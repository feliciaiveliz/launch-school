// function reverse(input) {
//   let result;
//
//   if (Array.isArray(input)) {
//     result = [];
//   } else {
//     result = '';
//   }
//
//   for (let idx = input.length - 1; idx >= 0; idx -= 1) {
//     if (Array.isArray(result)) {
//       result.push(input[idx]);
//     } else {
//       result += input[idx];
//     }
//   }
//
//   return result;
// }

function reverse(inputForReversal) {
  if (Array.isArray(inputForReversal)) {
    return reverseArray(inputForReversal);
  } else {
    return reverseString(inputForReversal);
  }
}

function reverseArray(inputForReversal) {
  const reversed = [];
  const length = inputForReversal.length;

  for (let i = 0; i < length; i += 1) {
    reversed[length - i] = inputForReversal[i];
  }

  return reversed;
}

function reverseString(inputForReversal) {
  const stringArray = inputForReversal.split(' ');
  return reverseArray(stringArray).join(' ');
}

console.log(reverse('Hello'));           // "olleH"
console.log(reverse('a'));               // "a"
console.log(reverse([1, 2, 3, 4]));      // [4, 3, 2, 1]
console.log(reverse([]));                // []

const array = [1, 2, 3];
console.log(reverse(array));             // [3, 2, 1]
console.log(array);                      // [1, 2, 3]
