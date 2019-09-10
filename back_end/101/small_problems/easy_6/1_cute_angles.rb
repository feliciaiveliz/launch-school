=begin
Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and 
returns a String that represents that angle in degrees, minutes and seconds. You should use a degree symbol (°) 
to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds. A degree 
has 60 minutes, while a minute has 60 seconds.

input: floating point number
output: string
requirements: 
- string represents the angle in degrees, minutes and seconds
- floating point number reps. angle between 0 and 360 degrees
- use DEGREE = "\Xc2\XB0" for degree symbol
- ( ' ) for minutes and ( " ) for seconds
- a degree has 60 minutes and a minute has 60 seconds- 1 degree has 3600 seconds
- use two digit numbers with leading zeros when formatting the minutes and seconds
data structure: %
algorithm: 
- create dms(number) method
- number % 1 to give you minutes and * 60 to give you whole number minutes
- save to variable 'minutes'
- minutes % 1 * 60 
- how do i use divmod? 
- degress, minutes, seconds = 
=end 

# DEGREE = "\xC2\xB0"

# def dms(number)
#   degree = number.divmod(1).first      
#   minutes = number.divmod(1).last * 60
#   seconds = minutes.divmod(1).last * 60
#   "#{format('xC2xB0', degree)}#{format('%02d', minutes)}#{"'"}#{format('%02d', seconds)}"
# end

# Another way that I thought could work by researching:
# "#{degree}#{degrees}#{format("%02d'%02d", minutes, seconds)}"
# "#{degree}#{DEGREE}#{format("%02d'%02d", minutes, seconds)}"

DEGREE = "\xC2\xB0"

def dms(number)
  degrees = "\xC2\xB0"
  degree = number.divmod(1).first      
  minutes = number.divmod(1).last * 60
  seconds = minutes.divmod(1).last * 60
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# "#{degree}#{degrees}#{format("%02d'%02d", minutes, seconds)}"
