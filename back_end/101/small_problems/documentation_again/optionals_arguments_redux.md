### Assume you have the following code: 

```
require 'date'

puts Date.new #=> -4712-01-01
puts Date.new(2016) #=> 2016-01-01
puts Date.new(2016, 5) #=> 2016-05-01
puts Date.new(2016, 5, 13) #=> 2016-05-13
```

### What will each of the 4 puts statements print?

This creates a date object using the provided calendar date. The month and day must either be positive or negative, but not zero. Year defaults to -4712 if it is not included. month defaults to 1 (January) and mday defaults to 1 (day of month) and start defaults to Date::ITALY. [] means that parameters are optional. 