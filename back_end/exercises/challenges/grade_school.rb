=begin

input: string name; integer grade
output: hash => key: grade, value: array of students
problem:
- for the '#add' method:
  - reference the students array using 'grade' as key
    - this will return the students array
    - add the student to the array using #<< and sort! the array
    - this sort will happen after every addition
- for the 'to_h' method:
  - return the '@roster' as is
- for the 'grade' method:
  - reference the students who are in the grade specified array
    using @roster[grade] syntax; this returns the array of students in that grade
=end

class School
  def initialize
    @roster = Hash.new { |roster, grade| roster[grade] = [] }
  end

  def add(student, grade)
    (@roster[grade] << student).sort!
  end

  def to_h
    @roster
  end

  def grade(number)
    @roster[number]
  end
end


