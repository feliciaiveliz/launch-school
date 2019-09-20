=begin

Create a method that takes 2 arguments, an array and a hash. The array will contain 2 or more elements that, when combined with adjoining spaces, will produce a person's name. The hash will contain two keys, :title and :occupation, and the appropriate values. Your method should return a greeting that uses the person's full name, and mentions the person's title.

input: array, hash
output: string greeting
requirements: 
- array contains 2 or more elements w/ adjoining spaces that will produce name
- hash contains two keys, :title and :occupation and their values
rules: 
- return a greeting that uses person's whole name and includes their title
example: 
greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
=> Hello, John Q Doe! Nice to have a Master Plumber around.
data structure: array, hash, string
algorithm: 
- define greetings method that passes in array and hash parameters
- use string interpolation to plug in appropriate values into string
- #{name.join(' ')}
=end

def greetings(array, hash)
  "Hello, #{array[0]} #{array[1]} #{array[2]}! Nice to have a #{hash[:title]} #{hash[:occupation]} around!"
end

puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })

# or 

def greetings(name, status)
  "Hello, #{name.join(' ')}! Nice to have a #{status[:title]} #{status[:occupation]} around!"
end

puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })

# Further Exploration:

def greetings(name, status)
  full_name = name.join(' ')
  job = status.values.join(' ')

  "Hello, #{full_name}! Nice to have a #{job} around."
end

puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
