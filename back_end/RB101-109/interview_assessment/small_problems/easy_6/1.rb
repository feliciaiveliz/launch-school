=begin

Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a String that represents that angle in degrees, minutes and seconds. You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

input: floating point number
output: string angle in degrees, minutes, seconds
rules: 
- angle is between 0 and 360 degrees
- use degree symbol for degree
- use (') to represent minutes
- use (") to represent seconds
- degree has 60 minutes
- minute has 60 seconds
examples: 
dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
data structure: integers, array
pseudo-code: 
- create a variable called degree
  - use whole number part of decimal as degree
- create a variable called minutes
  - calc. minutes using the remaining decimal * 60 
- create a variable called seconds
  - calc. seconds using the remaining decimal of previous calc. * 60
- 
algorithm: 
- init. variable 'degree' and assign it to angle.divmod(1) to isolate whole number
  - degree.first to retrieve first element 
- init. variable 'minutes' and assign it to angle.divmod(1).last * 60
  - this retrieves the second element
- init. variable 'seconds' and assign it to minutes.divmod(1).last * 60
- use constant DEGREE = "\xC2\xB0" to represent degrees
- %(#{degree}#{DEGREE}#{minutes}'#{seconds}")
=end

DEGREE = "\xC2\xB0"

def dms(angle)
  if angle < 0 
    angle += 360 until angle > 0
  elsif angle > 360
    angle = (360 - 400).abs
  end

  degree = angle.divmod(1).first
  minutes = (angle.divmod(1).last * 60)
  seconds = (minutes.divmod(1).last * 60).round

  format(%(#{degree}#{DEGREE}%02d'%02d"), minutes, seconds)
end

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
puts dms(400) == %(40°00'00")
puts dms(-40) == %(320°00'00")
puts dms(-420) == %(300°00'00")


# Come back to this problem