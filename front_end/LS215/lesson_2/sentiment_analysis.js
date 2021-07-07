// Implement a function that takes some text as an argument and logs some information about whether the text has a positive, negative, or neutral sentiment.

/*
input: string of text
output: summary of sentiment of text, in the form of strings
rules:
- text is positive if difference is positive (positive - negative)
- text is negative if difference is negative
- text is neutral if difference is 0
algorithm:
- declare variable 'positiveStrings' to []
- declare variable 'negativeStrings' to []
- declare variable 'result' to 0
- call filter() on input string:
  - cb function: add word to positiveStrings if positiveWords contains word
    - repeat operation with negative words
- Count the number of words in each array using 'length'
- 'result' = positiveStrings - negativeStrings
- return summary
*/

let textExcerpt = 'To be or not to be-that is the question:\n' +
  'Whether \'tis nobler in the mind to suffer\n' +
  'The slings and arrows of outrageous fortune,\n' +
  'Or to take arms against a sea of troubles,\n' +
  'And, by opposing, end them. To die, to sleep-\n' +
  'No more-and by a sleep to say we end\n' +
  'The heartache and the thousand natural shocks\n' +
  'That flesh is heir to-\'tis a consummation\n' +
  'Devoutly to be wished. To die, to sleep-\n' +
  'To sleep, perchance to dream. Aye, there\'s the rub,\n' +
  'For in that sleep of death what dreams may come,\n' +
  'When we have shuffled off this mortal coil,\n' +
  'Must give us pause. There\'s the respect\n' +
  'That makes calamity of so long life.\n' +
  'For who would bear the whips and scorns of time,\n' +
  'Th\' oppressor\'s wrong, the proud man\'s contumely, [F: poor]\n' +
  'The pangs of despised love, the law’s delay, [F: disprized]\n' +
  'The insolence of office, and the spurns\n' +
  'That patient merit of the unworthy takes,\n' +
  'When he himself might his quietus make\n' +
  'With a bare bodkin? Who would fardels bear, [F: these Fardels]\n' +
  'To grunt and sweat under a weary life,\n' +
  'But that the dread of something after death,\n' +
  'The undiscovered country from whose bourn\n' +
  'No traveler returns, puzzles the will\n' +
  'And makes us rather bear those ills we have\n' +
  'Than fly to others that we know not of?\n' +
  'Thus conscience does make cowards of us all,\n' +
  'And thus the native hue of resolution\n' +
  'Is sicklied o\'er with the pale cast of thought,\n' +
  'And enterprises of great pitch and moment, [F: pith]\n' +
  'With this regard their currents turn awry, [F: away]\n' +
  'And lose the name of action.-Soft you now,\n' +
  'The fair Ophelia.-Nymph, in thy orisons\n' +
  'Be all my sins remembered';

let positiveWords = ['fortune', 'dream', 'love', 'respect', 'patience', 'devout', 'noble', 'resolution'];
let negativeWords = ['die', 'heartache', 'death', 'despise', 'scorn', 'weary', 'trouble', 'oppress'];

function sentiment(text) {
  let positiveStrings = text.split(/[^a-z]/).filter(word => positiveWords.includes(word.toLowerCase()));
  let negativeStrings = text.split(/[^a-z]/).filter(word => negativeWords.includes(word.toLowerCase()));
  let result = positiveStrings.length - negativeStrings.length;
  let sentiment;

  if (result > 0) {
    sentiment = 'Positive';
  } else if (result < 0) {
    sentiment = 'Negative';
  } else {
    sentiment = 'Neutral';

  return `There are ${positiveStrings.length} words in the text.\nPositive sentiments: ${positiveStrings.join(' ')}\nThere are ${negativeStrings.length} words in the text.\nNegative sentiments: ${negativeStrings.join(' ')}\nThe sentiment of the text is ${sentiment}.`
}

console.log(sentiment(textExcerpt));


// There are 5 positive words in the text.
// Positive sentiments: fortune, dream, respect, love, resolution
//
// There are 6 negative words in the text.
// Negative sentiments: die, heartache, die, death, weary, death
//
// The sentiment of the text is Negative.
