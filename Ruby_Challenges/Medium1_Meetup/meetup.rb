require 'date'

class Meetup
  TEENTHS = (13..19).to_a
  NUMDAYS = (1..31).to_a
  DAYZ = { sunday: 0, monday: 1, tuesday: 2,
           wednesday: 3, thursday: 4, friday: 5,
           saturday: 6 }

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(wkday, arg)
    if arg == :teenth && DAYZ.keys.include?(wkday)
      the_teens(wkday)
    elsif arg == :first
      informer(wkday)
    elsif arg == :second
      informer(wkday, 2)
    elsif arg == :third
      informer(wkday, 3)
    elsif arg == :fourth
      informer(wkday, 4)
    elsif arg == :last
      last_one(wkday)
    end
  end

  private

  attr_reader :year, :month

  def full_month
    f_month = []
    NUMDAYS.each do |d|
      f_month << Date.new(year, month, d) if Date.valid_date?(year, month, d)
    end
    f_month
  end

  def the_teens(wkday)
    full_month.each do |date|
      return date if date.wday == DAYZ[wkday] && TEENTHS.include?(date.day)
    end
  end

  def informer(wkday, nth=1)
    count = 0
    full_month.each do |date|
      count += 1 if date.wday == DAYZ[wkday]
      return date if count == nth
    end
  end

  def last_one(wkday)
    full_month.reverse.each { |date| return date if date.wday == DAYZ[wkday] }
  end
end
