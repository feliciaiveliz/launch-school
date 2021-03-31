### What does this code print?

```
5.step(to: 10, by: 3) { |value| puts value } => 5, 8
```
Numeric#step signatures: 

 * step(by: step, to: limit) { |i| block } => self
 * step(by: step, to: limit) => an_enumerator
 * step(limit=nil, step=1) { |i| block } => self
 * step(limit=nil, step=1) => an_enumerator

This invokes the given block with the sequence of numbers starting at num, incrementing by step (default to 1) on each call. :by is the 'step', while the argument :to is the 'limit'. If the index exceeds the limit, the loop exits. 

These are the classes to look in when searching for methods that work with numbers.

 * Integer
 * Float
 * Numeric
 * Math