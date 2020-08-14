### The Array#bsearch method is used to search ordered Arrays more quickly than #find and #select can. Assume you have the following code: 

```
a = [1, 4, 8, 11, 15, 19]
```

### How would you search this Array to find the first element whose value exceeds 8?

 * bsearch {|x| block } => elem
This method uses binary search to find a value from an array that meets the given condition. It takes an argument, a block and returns an element from the array. It can be used in find-minimum mode and a find-any mode. In find-any mode, the block must always return a number, either positive, negative, or zero. In find-minimum mode, the block must return always return true or false and there must be an index. 

```
a.bsearch { |x| x > 8 } #=> 11
```