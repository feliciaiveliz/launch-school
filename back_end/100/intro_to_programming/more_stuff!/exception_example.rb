# Basic structure of rescue operation
begin 
  # perform some dangerous operation
rescue
  # do this if operation fails
  # for example, log the error
end



names = ['vin', 'felicia', 'gian', nil, 'bobby']

names.each do |name|
  begin 
    puts "#{name}'s name has #{name.length} letters in it."
  rescue
    puts "Something went wrong!"
  end
end