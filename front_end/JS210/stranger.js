function greetings(...args) {
  let name = args[0];
  let job = args[1];

  return `Hello, ${name.join(' ')}! Nice to have a ${job.title} ${job.occupation} around here.`;
}

console.log(greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' }));
