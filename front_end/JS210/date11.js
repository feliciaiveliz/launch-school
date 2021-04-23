let tomorrow = new Date(today.getTime());

tomorrow.setDate(today.getDate() + 1);
console.log(formattedDate(tomorrow));
