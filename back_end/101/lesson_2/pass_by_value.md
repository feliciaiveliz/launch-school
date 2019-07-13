## Pass by Reference vs Pass by Value
This is to help me understand how to invoke methods with the behavior I'd expect. The goal is to determine what happens to objects when passed into methods. 

### There are two ways of dealing with objects passed into methods:
1. You can treat these arguments as 'references' to the original objects
2. Or as 'values', which are copies of the original. 

### What does pass by 'value' mean?
In C terms, when you 'pass by value', the method only has a copy of the original object. Operations performed on the object within the method have no effect on the original object outside of the method. 
Some Rubyists say Ruby is 'pass by value' because reassigning the object within the method doesn't affect the object outside the method. 

```
def change_name(name)
  name = 'felicia'
end

name = 'Leash'
change_name(name)
puts name  # => Leash

```
There are two different local variables named name. One is scope within the method and there is one in main.
1. Not variable shadowing- main scope variable is not accessible to the method. 
2. 'name' variable could have been named anything.
3. When main scope 'name' is passed into the method, via change(name), did we pass in a reference or did we pass in a value?
4. Answer: it looks like 'pass by value' since re-assigning the variable only affected the method-level variable and not the main scope variable

### What does pass by 'reference' mean?
If Ruby was pure 'pass by value' then there should be no way for operations within a method to cause changes to the original object. But in Ruby it's possible.

```
def cap(str)
  str.capitalize!
end

name = 'felicia'
cap(name)
puts name  # => Felicia
```
1. Operations within the method affected the original object
2. Implies 'pass by reference'

```
def cap(str)
  str.capitalize
end

name = 'felicia'
cap(name)
puts name  # => felicia
```
1. We are back in the 'pass by value'
2. Operations within method didn't affect the original

### What Ruby Does
Ruby exhibits behaviors from both 'pass by reference' and 'pass by value'
Some people call it 'pass by reference of the value or call by sharing'
When an operation within the method mutates the caller, it will affect the original object.

```
def add_name(arr, name)
  arr << name
end

names = ['felicia', 'kayla']
add_name(names, 'camille')
puts names.inspect  # => ['felicia', 'kayla', 'camille']
```
By sending the names array through the add_name method, it permenantly changed the original names array.
* Reassignment is not considered a destructive operation.

```
def add_name(arr, name)
  arr = arr + [name] # adding two arrays together
end

names = ['felicia', 'kayla']
add_name(names, 'camille')
puts names.inspect  # => ['felicia', 'kayla']

def add_name(arr, name)
  arr = arr << name
end

names = ['felicia', 'kayla']
add_name(names, 'camille')
puts names.inspect # => ['felicia', 'kayla', 'camille']
```
When we use + to concatenate two arrays together, it is returning a new array and not mutating the original. When we use << to append a new value into an array, it is mutating the original array and not returning a new array.
