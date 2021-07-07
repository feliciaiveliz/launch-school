let rlSync = require('readline-sync');
let bill_amount = parseInt(rlSync.question("What is the bill? "));
let tip_percentage = parseInt(rlSync.question("What is the tip tip percentage? "));

let tip = bill_amount * (tip_percentage / 100);
let total_bill = (bill_amount + tip);

console.log(`The tip is $${tip.toFixed(2)}.`);
console.log(`The total is $${total_bill.toFixed(2)}.`)
