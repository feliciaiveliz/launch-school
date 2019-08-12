arr = [15, 7, 18, 5, 12, 8, 5, 1]

 puts arr.index(5) # 3

 puts arr.index[5] # This throws an error. undefined method `[]' for #<Enumerator: [15, 7, 18, 5, 12, 8, 5, 1]:index>
        # from (irb):3
        # from /usr/local/rvm/rubies/ruby-2.4.1/bin/irb:11:in `<main>' 
 
 puts arr[5] # 8