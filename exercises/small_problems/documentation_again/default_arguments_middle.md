### Consider the following method and a call to that method: 

```
def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)
```
This code will print out 
```
=> [4, 5, 3, 6]
```
#### Default Positional Arguments
Ruby will fill in the missing arguments in order first, from left to right. It also allows default values to appear in the middle of the positional arguments. 
First it assigns 4 to 'a', then 6 to 'd'. That leaves 5, so it assigns it to 'b', and 'c' keeps its default value.