// let weather = 'snow storm'; // 'sunny', 'rainy', ...
//
// if (weather === 'sunny') {
//   console.log("It's a beautiful day!");
// } else if (weather === 'rainy') {
//   console.log('Grab your umbrella.');
// } else {
//   console.log("Let's stay inside.");
// }

let weather = 'stormy';

switch (weather) {
  case 'sunny':
    console.log("Nice day to go to the beach!");
    break;
  case 'stormy':
    console.log("We better stay inside :)");
    break;
  case 'snowy':
    console.log("Grab your coats, it's very cold!");
    break;
  case 'windy':
    console.log("Hold on to your hats!");
    break;
  default:
    console.log("Let's go for a walk, the weather is favorable.")

}
