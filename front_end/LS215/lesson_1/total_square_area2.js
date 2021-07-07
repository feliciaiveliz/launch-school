// Now, write a second Function named totalSquareArea. This Function should calculate the total area of a set of rectangles, just like totalArea. However, it should only include squares in its calculations: it should ignore rectangles that aren't square.
//

/*
input: two dimensional array; subarrays contain 2 numbers
output: number; total square area of all 'square' rectangles (subarrays)
algorithm:
- define filterSquares Function
  - call filter() on input array:
    - each subarray: check if first and second number are equal
  - return array of square rectangles
- pass return value of filterSquares to totalSquareArea to compute total
*/

function totalArea(array) {
  let rectangleAreas = array.map(rectangle => rectangle[0] * rectangle[1]);
  return rectangleAreas.reduce((total, area) => total + area);
}

function filterSquares(array) {
  return array.filter(rectangle => rectangle[0] === rectangle[1]);
}

function totalSquareArea(array) {
  array = filterSquares(array);
  let rectangleAreas = array.map(rectangle => rectangle[0] * rectangle[1]);
  return rectangleAreas.reduce((total, area) => total + area);
}

// or

function totalSquareArea(array) {
  array = filterSquares(array);
  return totalArea(array);
}

let rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];
console.log(totalSquareArea(rectangles));
