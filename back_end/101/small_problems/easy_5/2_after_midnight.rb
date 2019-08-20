=begin

Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.

input: integers
output: string
rules: 
- time should be in 24 hour format hh:mm
- if number positive, time is AFTER midnight
- if negative, time is BEFORE midnight
- input will be in minutes format
 
0 - 00:00 midnight- POSITIVE
1 - 01:00
2 - 02:00 3000 minutes / 60 minutes / 24 hours
3 - 03:00
4 - 04:00
5 - 05:00
6 - 06:00
7 - 07:00
8 - 08:00
9 - 09:00
10 - 10:00
11 - 11:00

12 - 12:00 p.m- NEGATIVE
1 - 13:00 
2 - 14:00
3 - 15:00
4 - 16:00
5 - 17:00
6 - 18:00
7 - 19:00
8 - 20:00
9 - 21:00
10 - 22:00
11 - 23:00

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
  time = time % 1440 
  hours, minutes = time.divmod(60)
  format('%02d:%02d', hours, minutes)
end

p time_of_day(0)
p time_of_day(-3)
p time_of_day(35)
p time_of_day(-1437)
p time_of_day(3000)
p time_of_day(800)
p time_of_day(-4231)

