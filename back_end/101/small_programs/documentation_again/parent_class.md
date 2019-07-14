### Use irb to run the following code: 

```
s = 'abc'
puts s.public_methods.inspect
```

Prints: 
```
[:include?, :%, :*, :+, :to_c, :count, :unicode_normalize, :unicode_normalize!, :unicode_normalized?, :partition, :unpack, :unpack1, :sum, :next, :casecmp, :casecmp?, :insert, :bytesize, :match, :match?, :succ!, :+@, :-@, :index, :rindex, :<=>, :replace, :clear, :upto, :getbyte, :==, :===, :setbyte, :=~, :scrub, :[], :[]=, :chr, :scrub!, :dump, :byteslice, :upcase, :next!, :empty?, :eql?, :downcase, :capitalize, :swapcase, :upcase!, :downcase!, :capitalize!, :swapcase!, :hex, :oct, :split, :lines, :reverse, :chars, :codepoints, :prepend, :bytes, :concat, :<<, :freeze, :inspect, :intern, :end_with?, :crypt, :ljust, :reverse!, :chop, :scan, :gsub, :ord, :start_with?, :length, :size, :rstrip, :succ, :center, :sub, :chomp!, :sub!, :chomp, :rjust, :lstrip!, :gsub!, :chop!, :strip, :to_str, :to_sym, :rstrip!, :tr, :tr_s, :delete, :to_s, :to_i, :tr_s!, :delete!, :squeeze!, :each_line, :squeeze, :strip!, :each_codepoint, :lstrip, :slice!, :rpartition, :each_byte, :each_char, :to_f, :slice, :ascii_only?, :encoding, :force_encoding, :b, :valid_encoding?, :tr!, :encode, :encode!, :hash, :to_r, :<, :>, :<=, :>=, :between?, :clamp, :instance_of?, :kind_of?, :is_a?, :tap, :public_send, :method, :remove_instance_variable, :define_singleton_method, :instance_variable_set, :public_method, :singleton_method, :extend, :to_enum, :enum_for, :!~, :respond_to?, :object_id, :send, :display, :nil?, :class, :singleton_class, :clone, :dup, :itself, :taint, :tainted?, :untaint, :untrust, :untrusted?, :trust, :frozen?, :methods, :singleton_methods, :protected_methods, :private_methods, :public_methods, :instance_variable_get, :instance_variables, :instance_variable_defined?, :!, :!=, :__send__, :equal?, :instance_eval, :instance_exec, :__id__]
 => nil 
```
### How would you modify this code to print just the public methods that are defined or overridden by the String class? 
```
puts s.public_methods(false).inspect
```

This prints out all of the public methods available to the String 's'; these includes methods defined in the String class, as well as methods that are inherited from Object(which inherits from other methods from the BasicObject class and Kernel module). 

 * public_methods(all=true) => array
 * This returns the list of public methods accessible to obj. If the all parameter is set to false, only those methods in the receiver will be listed. 
