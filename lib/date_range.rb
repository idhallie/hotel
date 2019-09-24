require 'date'

class DateRange
  attr_reader :start_date, :end_date
  
  def initialize(start_date:, end_date:)
    @start_date = start_date
    @end_date = end_date
    
    unless start_date.instance_of?(Date) && end_date.instance_of?(Date)
      raise ArgumentError.new("Dates must be entered as Date.new(yyyy, mm, dd). Got start date: #{start_date} and end_date: #{end_date}.")
    end
  end
  
  def date_conflict(comp_start_date, comp_end_date)
    if comp_start_date >= start_date && comp_start_date < end_date || comp_end_date > start_date && comp_end_date < end_date
      return true
    elsif comp_start_date <= start_date && comp_end_date >= end_date
      return true
    end
    return false
  end
  
end
