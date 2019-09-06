require 'date'

class Reservation
  attr_reader :id, :room, :date_range
  
  def initialize(id:, room: nil, date_range:)
    @id = id
    @room = room
    @date_range = date_range
    
    unless id.instance_of?(Integer) && id > 0
      raise ArgumentError.new("ID must be a positive integer (got #{id}).")
    end
    
  end
  
  def total_cost
    return (date_range.end_date - date_range.start_date) * 200
  end
end
