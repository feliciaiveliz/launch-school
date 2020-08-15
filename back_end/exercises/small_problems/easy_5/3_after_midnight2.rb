=begin

input: string 
output: integer
rules: 
- input will represent time of day in 24hr format
- output will be number of minutes before or after midnight
- both methods will return a value between 0..1439
- minutes in a day = 1440
- before midnight method will be times between 12pm-12am 
algorithm: 
- create after_midnight method(time_string)
- initialize hours and minutes variable, assign them to time_string.split(':')
- call .map(&:to_i)
- (hours * 60 + minutes) % 1440
- end method
- create before_midnight(time_string) method
- assign variable delta_minutes to 1440 - after_midnight(time_string)
- assign delta_minutes to 0 if delta_minutes == 1440
- return delta minutes
- end method
=end

def after_midnight(time_string)
  hours, minutes = time_string.split(':').map(&:to_i)
  (60 * hours + minutes) % 1440
end

def before_midnight(time_string)
  delta_minutes = 1440 - after_midnight(time_string)
  delta_minutes = 0 if delta_minutes == 1440
  delta_minutes
end

def before_midnight(time_string)
  (1440 - after_midnight(time_string)) % 1440 
end


p after_midnight('00:00')
p before_midnight('00:00')
p after_midnight('12:34') 
p before_midnight('12:34')
p after_midnight('24:00')
p before_midnight('24:00')