Howdy! I was able to figure out the values for `a` and `b` without any issue, but I was reviewing the problem and wanted to make sure I knew exactly why I knew the answers. 

Here's the problem in question: 

```ruby
a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

# Solution: 
a # => 2
b # => [3, 8]
```

I ran the object id's for all values and found this: 

```ruby
a.object_id   # => 5
b.object_id   # => 44632040
arr.object_id # => 45019360

arr[0].object_id # => 5
arr[1].object_id # => 44632040
```

When we perform this action, the object id of `arr` and `a` stays the same, but the object id of arr[0] changes: 

```ruby 
arr[0] += 2         # => arr = [4, [5, 8]]
arr.object_id      # => 45019360
a.object_id        # => 5
arr[0].object_id  # => 9  - previously 5, the same object as `a`
```

It says here: `a` is not modified but the arr array is, I'm confused at this part. If the object isn't changing, does that mean it is modified, or does it mean that the elements and their id's change *within* it are modified, therefore the array is modified? Sorry if it's confusing, i just want to be extremeley clear on what is meant by 'something is modified.' 

























