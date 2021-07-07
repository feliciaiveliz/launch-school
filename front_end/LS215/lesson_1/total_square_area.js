// Write a Function named totalArea that takes an Array of rectangles as an argument. The Function should return the total area covered by all the rectangles.
//

/*
input: two dimensional array; subarrays contain 2 numbers
output: number; total square area of all rectangles (subarrays)
algorithm:
- declare rectangleAreas
  - call map() on 'array' and apply callback function:
    - cb function: 'rectangle' => add first element + second element
- return;
  - call reduce() on rectangleAreas and apply callback function:
    - cb function: 'total', 'area' => add total + area
*/

let rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

function totalArea(array) {
  let rectangleAreas = array.map(rectangle => rectangle[0] * rectangle[1]);
  return rectangleAreas.reduce((total, area) => total + area);
}

console.log(totalArea(rectangles));    // 141
