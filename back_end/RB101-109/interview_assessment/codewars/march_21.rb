=begin

input: string of names
output: string of initialed names
- First initial.Second initial.Last Name
problem:
- capitalize all names and use only first letters of 
  first and second name
- put them all together with '.' seperating them
ALGORITM:
- split string using #split
- initialize 'last_name' to last name of array.capitalize (string)
- map over first (and second name) and capitalize first letter: (['C'])
- add last name to mapped name: ['C', 'Wars']
- join using #join('.')
=end

def initials(name)
  name = name.split
  last_name = name.pop.capitalize
  (name.map! { |name| name[0].capitalize } << last_name).join('.')
end

p initials('code wars')
p initials('Barack hussein obama')
p initials('barack hussein Obama')

=begin

Problem 2: Insert dashes

Write a function insertDash(num)/InsertDash(int num) that will insert dashes ('-') between each two odd numbers in num. For example: if num is 454793 the output should be 4547-9-3. Don't count zero as an odd number.
Note that the number will always be non-negative (>= 0).

input: integer
output: string integer with dashes between two odd numbers
problem: 
- insert dashes between odd numbers
- dont insert dash unless odd number comes before it
ALGORITHM:
- initialize 'dashed' to ""
- initialize 'previous' to 0
- split integers using #digits and #reverse
- iterate using #each
  - IF previous(integer) is odd && n(integer) is odd
  - assign previous to n(integer)
  - add '-' to dashed and n(string)
  - ELSE assign previous to n(string)
  - add n(string) to dashed
- return string
=end

def insert_dash(number)
  dashed = ""
  previous = 0

  number.digits.reverse.each do |n|
    n = n.to_s
    if previous.to_i.odd? && n.to_i.odd?
      previous = n
      dashed << '-' << n
    else
      previous = n
      dashed << n
    end
  end
  dashed
end

puts insert_dash(454793) == '4547-9-3'
p insert_dash(123456) == '123456'
p insert_dash(1003567) == '1003-567'
p insert_dash(24680) == '24680'
p insert_dash(13579) == '1-3-5-7-9'

=begin

Problem 3: Replace every nth | 7 kyu

Write a method, that replaces every nth char 'oldValue' with char 'newValue'.

n: 2
oldValue: 'a'
newValue: 'o'
"Vader said: No, I am your father!" -> "Vader soid: No, I am your fother!"
  1     2          3        4       -> 2nd and 4th occurence are replaced

Your method has to be case sensitive!

As you can see in the example: The first changed is the 2nd 'a'. So the start is always at the nth suitable char and not at the first!

If n is 0 or negative or if it is larger than the count of the oldValue, return the original text without a change.
=end

def parts_sums(ls)
  sums = []
  
  until ls.empty?
    sums << ls.sum
    ls.shift
  end

  sums << 0
end

p parts_sums([0, 1, 3, 6, 10]) == [20, 20, 19, 16, 10, 0]