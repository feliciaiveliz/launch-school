require 'date'

TEENTH_DAYS = [13, 14, 15, 16, 17, 18, 19]
FIRST_WEEK = [1, 2, 3, 4, 5, 6, 7]
SECOND_WEEK = [8, 9, 10, 11, 12, 13, 14]
THIRD_WEEK = [15, 16, 17, 18, 19, 20, 21]
FOURTH_WEEK = [22, 23, 24, 25, 26, 27, 28]
LAST_WEEK = [23, 24, 25, 26, 27, 28, 29, 30, 31]

WEEKDAYS = {
  :monday => 1,
  :tuesday => 2,
  :wednesday => 3,
  :thursday => 4,
  :friday => 5,
  :saturday => 6,
  :sunday => 0 
 }

class Meetup  
  def initialize(month, year)
    @month = month
    @year = year
  end
  
  def day(weekday, schedule)
    day_number = 0

    WEEKDAYS.each do |day, number|
      day_number = number if weekday == day
    end

    meetup_schedule = case schedule
                      when :teenth then TEENTH_DAYS
                      when :first then FIRST_WEEK
                      when :second then SECOND_WEEK
                      when :third then THIRD_WEEK
                      when :fourth then FOURTH_WEEK
                      when :last then LAST_WEEK
                      end

    final_date = 0
    
    meetup_schedule.each do |date|
      meetup_date = Date.new(@year, @month, date)
      final_date = meetup_date if meetup_date.wday == day_number
    end
    final_date
  end
end


