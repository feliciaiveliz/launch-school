### What do each of these puts statements output?

```
a = %w(a b c d e)
puts a.fetch(7) #=> IndexError; no element at index 7; nil
puts a.fetch(7, 'beats me') #=> 'beats me'
puts a.fetch(7) { |index| index**2 } #=> 49
```

Array#fetch signatures: 

 * fetch(index) => obj
 * fetch(index, default) => obj
 * fetch(index) { |index| block } => obj

This method returns the element at position 'index', but throws an 'IndexError' exception if the referenced 'index' is outside of the array bounds. This can be prevented by supplying a second argument, which will act as a default value. If a block is given, it will only be executed when an invalid index is referenced. 
If negative values are included as one of the arguments, that means it will count from the end of the array. Default and blocks are optional but cannot be used together. 

