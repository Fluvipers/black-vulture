class TimeUnit < ActiveRecord::Base
  validates_presence_of :when
  before_save :set_attributes

  private
  def set_attributes
    self.year = self.when.year.to_s
    self.semester = set_time_lapse(self.when.month, 6)
    self.quarter = set_time_lapse(self.when.month, 4)
    self.bimester = set_time_lapse(self.when.month, 2)
    self.month = self.when.month.to_s
    self.month_of_year = self.when.strftime("%B")
    self.fortnight = set_time_lapse(self.when.day, 15)
    self.week_of_year = week_of_the_year
    self.week_of_month = week_of_the_month
    self.day = self.when.day.to_s
    self.day_of_week = self.when.wday.to_s
    self.day_of_month = self.when.mday.to_s
    self.day_of_year = self.when.yday.to_s
    self.noon = self.when.strftime("%p")
    self.hour = self.when.hour.to_s
    self.minute = self.when.min.to_s
    self.time_zone = self.when.strftime("%Z")
  end

  def set_time_lapse(unit, fraction)
    lapse_unit = unit/fraction.to_f
    lapse_unit.ceil.to_s
  end

  def week_of_the_month
    week_of_month_beginning = self.when.beginning_of_month.strftime("%W").to_i
    weekOfMonth = self.week_of_year.to_i - week_of_month_beginning
    weekOfMonth.to_s
  end

  def week_of_the_year
    self.when.strftime("%W").to_i + 1
  end
end
