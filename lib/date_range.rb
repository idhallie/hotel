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
end
