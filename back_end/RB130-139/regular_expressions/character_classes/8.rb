# Are /abc/i and /[Aa][Bb][Cc]/ equivalent regex? If not, how do they differ? Can you provide an example of a string that would match one of these regex, but not the other?

Yes, these are equal. The first regex pattern matches the sequence of characters a b and c regardless of case.
The second pattern matches ABC or abc in sequence.