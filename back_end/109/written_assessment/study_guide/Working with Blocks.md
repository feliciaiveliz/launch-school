# Working with Blocks

```ruby
[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end

# 1
# 3
# => [[1, 2], [3, 4]]
```

- `Array#each` is being called on the multidimensional array `[[1, 2], [3, 4]]`. 
- Each inner array is being passed to the block and assigned to local variable `arr`. 
- The `arr.first` method is called on `arr` which returns the objects at index `0` of the current array. In this case `1` and `3`.
- The `puts` method uses this return value as a string representation of the integer and outputs it to the screen.
- `puts` returns `nil` and since this is the evaluated result of the last line of code within the block, this is the return value of the block.
- `each` does nothing with this return value; it only returns the original calling object, the multi-dimensional array, `[[1, 2], [3, 4]]`.

***

What specific pieces of information are we interested in keeping track of? When evaluating code, ask these questions: 

1. What is the type of action being performed? (method call, block, conditional, etc.)
2. What is the object that action is being performed on?
3. What is the side-effect of that action? (output or destructive action)
4. What is the return value of that action?
5. Is the return value used by whatever instigated the action?

| Line | action                | object                         | side effect                                 | return value                   | is r.v used?                                 |
| ---- | --------------------- | ------------------------------ | ------------------------------------------- | ------------------------------ | -------------------------------------------- |
| 1    | method call (`each`)  | the outer array                | none                                        | the calling object             | no, but shown on line 6                      |
| 1-3  | block execution       | each sub-array                 | none                                        | `nil`                          | no                                           |
| 2    | method call (`first`) | each sub-array                 | none                                        | element at index 0 of subarray | yes, used by `puts`                          |
| 2    | method call (`puts`)  | element at index 0 of subarray | outputs string representation of an integer | `nil`                          | yes, used to determine return value of block |

***

```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
# 1
# 3
# [nil, nil]
```

| line | Action                | Object                         | Side Effect                                 | Return Value                   | is r.v used?                                     |
| ---- | --------------------- | ------------------------------ | ------------------------------------------- | ------------------------------ | ------------------------------------------------ |
| 1    | method call (`map`)   | the outer array                | none                                        | new array`[nil, nil]`          | no, but shown                                    |
| 1-3  | block execution       | each inner array               | none                                        | `nil`, `nil`                   | yes, used by `map` for transformation            |
| 2    | method call (`first`) | each inner array               | none                                        | element at index 0 of subarray | yes, used by `puts`                              |
| 2    | method call `puts`    | element at index 0 of subarray | outputs string representation of an integer | `nil`,`nil`                    | yes, used to determine return value of the block |

***

```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
```

| line | action                | object                         | side effect                                 | return value                              | is r.v used?                                     |
| ---- | --------------------- | ------------------------------ | ------------------------------------------- | ----------------------------------------- | ------------------------------------------------ |
| 1    | method call (`map`)   | outer array                    | none                                        | new array `[1, 3]`                        | no, but shown                                    |
| 1-4  | block execution       | each subarray                  | none                                        | element at index 0 of subarray            | yes, used by `map` for transformation            |
| 2    | method call (`first`) | each subarray                  | none                                        | element at index 0 of subarray            | yes, used by `puts`                              |
| 2    | method call (`puts`)  | element at index 0 of subarray | outputs string representation of an integer | `nil`                                     | no                                               |
| 3    | method call (`first`) | each subarray                  | none                                        | element at index 0 of subarrays, `1`, `3` | yes, used to determine return value of the block |

***

```ruby
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
```

| line | action                   | object                            | side effect                       | return value            | is r.v used?                                       |
| ---- | ------------------------ | --------------------------------- | --------------------------------- | ----------------------- | -------------------------------------------------- |
| 1    | variable assignment      | n/a                               | none                              | `[[18, 7], [3, 12]]`    |                                                    |
| 1    | method call (`each`)     | outer array, `[[18, 7], [3, 12]]` | none                              | original calling object | yes, used by variable assignment to `my_arr`       |
| 1-7  | outer block execution    | each subarray                     | none                              | each subarray           | no                                                 |
| 2    | method call (`each`)     | each subarray                     | none                              | each subarray           | yes, used to determine r.v of outer block          |
| 2-6  | inner block execution    | each subarray                     | none                              | `nil`                   | no                                                 |
| 3-5  | conditional if statement | each element of subarray          | none                              | `nil`                   | yes, used to determine return value of inner block |
| 4    | method call `puts`       | each element of subarray          | outputs string rep. of an integer | `nil`                   | yes, used to determine return value of inner block |

***

```ruby
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
```

| line | action                | object                                       | side effect | return value                    | is r.v used?                                           |
| ---- | --------------------- | -------------------------------------------- | ----------- | ------------------------------- | ------------------------------------------------------ |
| 1    | method call (`map`)   | outer array                                  | none        | new array `[[2, 4], [6, 8]]`    | no, but shown                                          |
| 1-5  | outer block execution | each subarray                                | none        | `[[2, 4], [6, 8]]`              | yes, used by top-level `map` for transformation        |
| 2    | method call (`map`)   | each subarray                                | none        | each integer from each subarray | yes, used to determine r.v of outer block              |
| 2-4  | inner block execution | every integer in subarray for that iteration | none        | `2`, `4`, `6`, `8`, an integer  | yes, used by inner map for transformation              |
| 3    | `num * 2`             | every integer in subarray for that iteration | none        | `2`, `4`, `6`, `8`, an integer  | yes, used to determine return value of the inner block |

