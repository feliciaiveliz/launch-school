/*
input: string
output: boolean
information:
- email has two parts: local part and domain part
- @ seperates two parts
- local part is name of mailbox, usually username
- domain part is domain username
rules:
- address must contain one @ sign
- local part must contain one more more letters and/or digits
- it cannot contain any other characters
- domaon part must contain two or more components with a single dot between each
- each component made of one or more letters, case insensitive only
alogrithm:
- local part: /[a-z0-9]\gi/
- @?
- domain part: .(a-z+.){2,}
- split string at @ symbol
- declare 'local' to ''
- declare 'domain' to ''
- save first element to local and second to domain
- if local.match(/[a-z0-9]\gi/) && (domain.match(/[a-z]{2,}/i))
*/


function isValidEmail(email) {
  return /^[a-z0-9]+@([a-z]+\.)+[a-z]+$/i.test(email);
}

console.log(isValidEmail('Foo@baz.com.ph'));          // returns true
console.log(isValidEmail('Foo@mx.baz.com.ph'));       // returns true
console.log(isValidEmail('foo@baz.com'));             // returns true
console.log(isValidEmail('foo@baz.ph'));              // returns true
console.log(isValidEmail('HELLO123@baz'));            // returns false
console.log(isValidEmail('foo.bar@baz.to'));          // returns false
console.log(isValidEmail('foo@baz.'));                // returns false
console.log(isValidEmail('foo_bat@baz'));             // returns false
console.log(isValidEmail('foo@bar.a12'));             // returns false
console.log(isValidEmail('foo_bar@baz.com'));         // returns false
console.log(isValidEmail('foo@bar.....com'));         // returns false
