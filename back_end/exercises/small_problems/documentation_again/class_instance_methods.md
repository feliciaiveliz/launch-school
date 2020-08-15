### Locate the ruby documentation for methods File::path and File#path. How are they different? 

They can both be found on the Ruby Docs page, in File class and the Core API section. 

File::path - https://ruby-doc.org/core-2.6.3/File.html#method-c-path
This returns the string representation of the path. This is a class method, which means that they are called on the class. 

```
puts File.path('bin')
```

File#path - https://ruby-doc.org/core-2.6.3/File.html#method-i-path
Returns the pathname used to create *file* as a string. This is an instance method, which means they are called on the objects. 

```
f = File.new('my-file.txt')
puts f.path
```
