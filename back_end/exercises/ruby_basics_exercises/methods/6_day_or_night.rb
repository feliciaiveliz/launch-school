# The variable below will be randomly assigned as true or false. Write a method named time_of_day that, given a boolean as an argument, prints "It's daytime!" if the boolean is true and "It's nighttime!" if it's false. Pass daylight into the method as the argument to determine whether it's day or night.

daylight = [true, false].sample

def time_of_day(daylight) # daylight here is a different variable than the top-level variable, and they both reference the same thing.
  if daylight
    puts "It's daytime!"
  else
    puts "It's nighttime!"
  end
end

def time_of_day(daylight)
  daylight ? (puts "It's daytime!") : (puts "It's nighttime!")
end

time_of_day(daylight)


