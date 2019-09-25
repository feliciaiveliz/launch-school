=begin

We wrote a method for moving a given number of elements from one array to another. We decide to test it on our todo list, but invoking move on line 11 results in a SystemStackError. What does this error mean and why does it happen?

def move(n, from_array, to_array)
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

output: 

Traceback (most recent call last):
        9360: from 6_getting_things_done.rb:33:in `<main>'
        9359: from 6_getting_things_done.rb:25:in `move'
        9358: from 6_getting_things_done.rb:25:in `move'
        9357: from 6_getting_things_done.rb:25:in `move'
        9356: from 6_getting_things_done.rb:25:in `move'
        9355: from 6_getting_things_done.rb:25:in `move'
        9354: from 6_getting_things_done.rb:25:in `move'
        9353: from 6_getting_things_done.rb:25:in `move'
         ... 9348 levels...
           4: from 6_getting_things_done.rb:25:in `move'
           3: from 6_getting_things_done.rb:25:in `move'
           2: from 6_getting_things_done.rb:25:in `move'
           1: from 6_getting_things_done.rb:25:in `move'
6_getting_things_done.rb:24:in `move': stack level too deep (SystemStackError)
=end

def move(n, from_array, to_array)
  return if n == 0 || from_array.empty? # this stop execution at zero and prevents it from exceeding its limit
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end


todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']