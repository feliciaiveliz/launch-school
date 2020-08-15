# Are /(ABC|abc)/ and /[Aa][Bb][Cc]/ equivalent regex? If not, how do they differ? Can you provide an example of a string that would match one of these regex, but not the other?

These are not equal. The first strings matches nothing but the strings ABC or abc
The second string matches any string of a b and c in sequence, regardless of case