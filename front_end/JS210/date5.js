let today = new Date();

function formattedDate(date) {
  let day = formattedDay(date);
  let month = formattedMonth(date);

  console.log(`Today's date is ${day}, ${month} ${dateSuffix(date.getDate())}`);
}

function formattedMonth(date) {
  let months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  return months[date.getMonth()];
}

function formattedDay(date) {
  let daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  return daysOfWeek[date.getDay()];
}

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

console.log(formattedDate(today));
