=begin

Create a method that takes 2 arguments, an array and a hash. The array will contain 2 or more elements that, when combined with adjoining spaces, will produce a person's name. The hash will contain two keys, :title and :occupation, and the appropriate values. Your method should return a greeting that uses the person's full name, and mentions the person's title and occupation.

input: array, hash
output: string, greeting
rules: 
- use the values from the array and hash to populate the string
data structure: array, hash, string
pseudo-code: 
- create a variable called name
- assign it to the values from the array that contains names
- create variable called occupation
- assign to the the values from the hash that contain this person's title/occupation
algorithm: 
- init. variable 'name', set it to the array
  - convert the array to a string seperated by spaces
- init. variable 'occupation'
  - set it to calling #values on the hash to retrieve the values
  - convert the array into a string seperated by spaces
- puts out a string that contains theses values
=end

def greetings(array, hash)
  name = array.join(' ')
  occupation = hash.values.join(' ')

  "Hello, #{name}! Nice to have a #{occupation} around!"
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })

