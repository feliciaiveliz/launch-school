# Working with Blocks
### Example 1: 

```ruby
[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
```

#### Explanation of Code: 
1. Array#each method is being called on `[[1, 2], [3, 4]]` multidimensional array
2. Each inner array is being passed to the block in turn and assigned to the local variable `arr`
3. The Array#first method is called on `arr` and returns the object at index `0` of the current array
4. `puts` outputs a string representation of the integers. 
5. `puts` returns `nil` and since it is the last evaluated expression within the block, it is the return value of the block
6. `each` ignores this return value and since `each` returns the calling object- `[[1, 2], [3, 4]]`, this is what is ultimately returned

### Questions to Ask: 
- What is the type of action being performed(method call, block, conditional, etc.)
- What is the object that action is being performed on?
- What is the side-effect of that action (output or destructive action)?
- What is the return value of that action?
- Is the return value used by whatever instigated the action?

#### Example 1 Tabular Breakdown: 
**Line** |      Action        |    Object     | Side Effect | Return Value    |     Is Return Value Used?         |
---------|--------------------|---------------|-------------|-----------------|-----------------------------------|
   5     | method call `each` | outer array   |     None    | calling object  | No, but shown on line 10   |
  5-7    | block execution    | each subarray |     None    | `nil`           |     No |
   6     | method call `first`| each subarray |     None    | element at index 0 of subarray | Yes, used by `puts|
   6     | method call `puts` | Element at 0 index of each subarray | Output string representation of integer | nil     | Yes, used to determine return value of block |    |
   

### Example 2: 

```ruby 
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
# 1
# 3
# => [nil, nil]
```

#### Example 2 Tabular Breakdown: 
**Line** |      Action        |    Object     | Side Effect | Return Value    |     Is Return Value Used?         |
---------|--------------------|---------------|-------------|-----------------|-----------------------------------|
   37     | method call `map` | [[1, 2], [3, 4]] |     None    | new array `[nil, nil]`  | No, but shown on line 42   |
  37-39    | block execution    | each subarray |     None    |   `nil`       |  Yes, map uses it to determine return value of block |
   38     | method call `first`| each subarray |     None    | element at index 0 of subarray | Yes, used by `puts|
   38     | method call `puts` | Element at 0 index of each subarray | Output string representation of integer | `nil`     | Yes, used to determine return value of block |    |
   



### Example 3: 

```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
```

#### Example 3 Tabular Breakdown:

**Line** |      Action        |    Object   | Side Effect | Return Value |     Is Return Value Used?         |
---------|--------------------|-------------|-------------|--------------|-----------------------------------|
   6     | method call `map`  | outer array |     None    | new array `[1, 3]`   | No, but shown on line 9   |
  6-9    | block execution    | each subarray |   None    | `[1, 3]`     |     Yes, used by `map` for transformation |
   7     | method call `first`| each subarray | None     | element at index 0 of each subarray | Yes, used by `puts`|
   7     | method call `puts` | Element at 0 index of each subarray | Output integer | nil     | No         |
   8     | method call `first`| each subarray | None     | `[1, 3]` | Yes, used by map as transformation criteria and return value of the block| 
   








### Example 4:

```ruby
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
   end
  end
```
#### Example 4 Tabular Breakdown - My Attempt: 
**Line** |      Action        |    Object     | Side Effect |     Return Value     |     Is Return Value Used?         |
---------|--------------------|---------------|-------------|----------------------|-----------------------------------|
   24    | method call `each` | [[18, 7], [3, 12]]   |   none      | [[18, 7], [3, 12]]   | Yes, saved to my_arr local variable   |
   24    | assignment         | my_arr        |   none      | return value of `each` on outer array  | No, but shown on line 33 |
 24-30   | outer block execution | outer array   |   none      | calling object       | Yes, used by my_arr variable |
 25-29   | block execution    | each subarray |   none      | each subarray        |              no              |
   25    | method call `each` | each subarray |   none      | each subarray        |              no              |
 26-28   | comparison and selection | each integer from each subarray | none       |  nil                          | no          |
  27     | method call `puts` | each integer from each subarray | outputs string rep. of Integer | nil             | no          |
  
#### LS Solution:

**Line** |      Action           |    Object     | Side Effect |     Return Value     |     Is Return Value Used?         |
---------|-----------------------|---------------|-------------|----------------------|-----------------------------------|
   24    | method call (`each`)  | [[18, 7], [3, 12]]   |   None      | [[18, 7], [3, 12]]   | Yes, saved to my_arr local variable   |
   24    | assignment            | my_arr        |   None      | [[18, 7], [3, 12]]   | No, but shown on line 33 |
 24-30   | outer block execution | each subarray |   None | each subarray       |              no              |
 25-29   | inner block execution | element of subarray in that iteration |   None   | nil     |              no              |
   25    | method call `each`    | each subarray |   None      | each subarray in current iteration(calling object)  |yes, used to determine r.v of outer block |
   26    | comparison (`>`)      | element of subarray in that iteration | None       | boolean  | yes, evaluated by `if`       | 
 26-28   | conditional (`if`)    | element of subarray in that iteration | None       |  nil     | yes, used to determine r.v of inner block |
  27     | method call (`puts`)  | element of subarray in that iteration | outputs string rep. of Integer | nil            | yes, used to determine r.v of inner block         |
  










