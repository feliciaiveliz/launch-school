=begin

Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.

input: integers
output: string
rules: 
- time should be in 24 hour format hh:mm
- if number positive, time is AFTER midnight
- if negative, time is BEFORE midnight
- input will be in minutes format
algorithm: 
- define 3 constants: MINUTES_PER_HOUR = 60, HOURS_PER_DAY = 24, MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR
- def time_of_day(delta_minutes)
- assign to delta_minutes = delta_minutes % MINUTES_PER_DAY
- assign to hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
- format('%02d:%02d', hours, minutes)
- end method
=end

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR # 1440

def time_of_day(delta_minutes)
  delta_minutes = delta_minutes % MINUTES_PER_DAY
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

def time_of_day(time)
  time = time % 1440               # 60 minutes * 24 hrs per day
  hours, minutes = time.divmod(60) # 
  format('%02d:%02d', hours, minutes)
end

p time_of_day(0)
p time_of_day(-3)
p time_of_day(35)
p time_of_day(-1437)
p time_of_day(3000)
p time_of_day(800)
p time_of_day(-4231)

