# Mock Test 

1. Describe what is happening here.

   ```ruby
   def greeting
     puts "Hello"
   end
   ```

   

2.  What is output and returned here? 

   ```ruby
   [1, 2, 3].each { |num| puts num }
   ```

   

3. What is output and returned here?

   ```ruby
   a = "hello"
   
   [1, 2, 3].map { |num| a }
   ```



4. What is happening here? 

   ```ruby
   greeting = 'Hello'
   
   loop do
     greeting = 'Hi'
     break
   end
   
   puts greeting
   ```

   

5. What is output here?

   ```ruby
   a = "Hello"
   
   if a
     puts "Hello is truthy"
   else
     puts "Hello is falsey"
   end
   ```

   

6. What is happening here?

   ```ruby
   a = 'hello'
   b = a
   a = 'goodbye'
   ```

   

7. What is output here?

   ```ruby
   a = 4
   
   loop do
     a = 5
     b = 3
     break
   end
   
   puts a
   puts b
   ```

   

8. What will be output here?

   ```ruby
   
   a = 4
   b = 2
   
   2.times do |a|
     a = 5
     puts a
   end
   
   puts a
   puts b
   ```

   

9. What is output and returned here? Why?

   ```ruby
   [1, 2, 3, 4].map { |num| puts num }
   ```

   

10. Describe what is happening here.

    ```ruby
    if 3
      puts "I evaluate to true"
    else
      puts "I evaluate to false?"
    end
    ```



11. Describe `map` in your own words.





12. What is happening here? What is the value of `a`?

    ```ruby
    def some_method(number)
      number = 7
    end
    
    a = 5
    some_method(a)
    puts a
    ```

    