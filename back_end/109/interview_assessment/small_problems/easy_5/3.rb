=begin

As seen in the previous exercise, the time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively. Both methods should return a value in the range 0..1439.

You may not use ruby's Date and Time methods.

input: string time
ouput: integer
rules: 
- # of min. positive? - after midnight
- # of min. negative? - before midnight
- 1440 minutes in 24 hours
- 00:00am - 12:00 pm = after_midnight
  - 12:34 is 754 from 0-12 hours + 34 minutes
- 12:00pm - 24:00 am = before_midnight
pseudo-code: 
- define after_midnight method, pass in time paramter
- multiple hour * 60 (minutes) to get total minutes
  - add remaining minutes 
  - 12 + 60 = 720 minutes + 34 extra, 754 after midnight
- create variable 'hour' 
  - retrieve first two digits from 24-hour time that is the hours
- create variable 'minutes' 
  - retrive the last two digits from 24-hours time
- 'hour' * 60 
- hour + minutes
=end


def after_midnight(time)
  # return 0 if time == "00:00" || time == "24:00"

  hour, minutes = time[0..1].to_i, time[3..4].to_i
  (hour * 60 + minutes) % 1440 
end

def before_midnight(time)
  minutes = 1440 - after_midnight(time)
  minutes = 0 if minutes == 1440
  minutes
end


p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0