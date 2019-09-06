require 'date'

class Reservation
  attr_reader :id, :room, :start_date, :end_date, :date_range
  
  def initialize(id:, room: nil, start_date:, end_date:)
    @id = id
    @room = room
    @start_date = start_date
    @end_date = end_date
    
    @date_range = DateRange.new(start_date: start_date, end_date: end_date)
    
    unless id.instance_of?(Integer) && id > 0
      raise ArgumentError.new("ID must be a positive integer (got #{id}).")
    end
    
  end
  
  def total_cost
    return (date_range.end_date - date_range.start_date) * 200
  end
end
