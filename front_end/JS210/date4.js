let daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

let dateTime = new Date();
let day = dateTime.getDay();
let date = dateTime.getDate();

function dateSuffix(date) {
  if (date === 13) {
    return 'th';
  }

  lastDigit = date % 10;

  switch (lastDigit) {
    case 1: return 'st';
    case 2: return 'nd';
    case 3: return 'rd';
    default: return 'th';
  }
}

console.log(`Today's date is ${daysOfWeek[day]}, the ${date}${dateSuffix(date)}.`);
