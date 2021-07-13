// Problem Description
// Write a program that cleans up user-entered phone numbers so that they can be sent as SMS messages. Other than digits, the number may also contain special character such as spaces, dash, dot, and parentheses that should be ignored.

// The rules are as follows:

// If the phone number is less than 10 digits, assume that it is a bad number.
// If the phone number is 10 digits, assume that it is good.
// If the phone number is 11 digits and the first number is 1, trim the 1 and use the last 10 digits.
// If the phone number is 11 digits and the first number is not 1, then it is a bad number.
// If the phone number is more than 11 digits, assume that it is a bad number.
// For bad numbers, just a return a string of 10 0s.

/*
Understand the Problem
----------------------
Input:
- A string that represents digits, spaces, dash, dot and parentheses
Output:
- A string representing a 'cleaned-up' version of the phone number:
  - no characters other than numbers
  - size of phone is 10 characters
  - ten 10 digit string
Rules:
- All characters that are not digits are to be ignored
- if phone number < 10 digits, it is bad
- if phone number === 10 digits, it is good
- if phone number === 11 digits and first number is 1, trim 1st number and use last 10 digits
- if phone number > 11, it is bad
Requirements:
- What is a good phone number?
  - phone number length is 10
  - phone number length is 11 and 1st number is 1
    - trim 1 and return number
- What is a bad phone number?
  - phone number greater than 11 
  - phone number length is 11 and 1st number is not 1
  - phone number less than 10
    - return 10 0's
      - '0000000000'
Examples/Test Cases:
- '12222222222'    -> '2222222222' -> first digit is 1, trim and return number
- '1234567890123'  -> '0000000000' -> string length > 11
- '(210)-409-5152' -> '2104095149' -> ignore non-digits, string size is 10
- '9876'           -> '0000000000' -> string length is < 10
- '21234567890'    -> '0000000000' -> first digit is 2, not 1

Data Structure:
---------------
- Input: 
  - An array
    - array holds all characters in string
- Rules: 
  - delete or replace all non-digit characters with empty space or just delete
  - leave only digits in array
  - return the array joined together into a string of only digits
Algorithm:
----------
- clean up word by replacing non-digits:
  - remove all characters that are non-digits and use new string:
    - if string length is 10
      - return string of 10 digits
    - if string size is 11 and first digit is 1
	  - remove first character and return string of 10 digits
	- if string length is greater than 11 or string length less than 10
	  - return '0000000000'
	- if string size is 11 and first digit is not 1
	  - return '0000000000'
- end
*/

function cleanUpPhoneNumber(stringOfDigits) {
  stringOfDigits = stringOfDigits.replace(/[^0-9]/g, '');
  
  if (stringOfDigits.length === 10) {
    return stringOfDigits;
  } else if (stringOfDigits.length === 11 && stringOfDigits[0] === '1') {
    return stringOfDigits.slice(1);
  } else {
    return '0000000000';
  }
}

console.log(cleanUpPhoneNumber('12222222222'));    // '2222222222'
console.log(cleanUpPhoneNumber('1234567890123'));  // '0000000000'
console.log(cleanUpPhoneNumber('(210)-409-5152')); // '2104095149' 
console.log(cleanUpPhoneNumber('9876'));           // '0000000000' 
console.log(cleanUpPhoneNumber('21234567890'));    // '0000000000' 