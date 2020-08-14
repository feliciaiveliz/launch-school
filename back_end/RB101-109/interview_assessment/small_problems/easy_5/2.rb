=begin

The time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.

You may not use ruby's Date and Time classes.

input: integer time
output: string time in 24hr format
rules: 
- if time is negative, time is before midnight
- if time is positive, time is after midnight
- if 0, return "00:00"
data structure: integer
pseudo-code: 
- minutes in a day: 1440 minutes
- hours in a day: 24 hours
- minutes in an hour: 60 minutes
- find the remainder of delta minutes % 1440
  - this give us the time difference
- using #divmod will break down the time difference into hours and minutes
- parellel assign hours, minutes
- format the time so that it produces a two-digit number with leading zeros
=end

def time_of_day(time)
  time = time % 1440
  hours, minutes = time.divmod(60)
  format('%02d:%02d', hours, minutes)
end

def time_of_day(time)
  time = (Time.new(2020, 1, 12) + time * 60)
  time.strftime('%A %R')
end

p time_of_day(0)
p time_of_day(-3) 
p time_of_day(35)
p time_of_day(-1437)
p time_of_day(3000)
p time_of_day(800)
p time_of_day(-4231)