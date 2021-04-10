function cite(author, quote) {
  console.log(`${author} said: ${quote}`);
}

// or

function cite(author, quote) {
  console.log(author + ' said: "' + quote + '"');
}
cite('Brendan Eich', 'Always bet on JavaScript.');
// logs:
// Brendan Eich said: "Always bet on JavaScript."
