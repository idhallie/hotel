class Reservation
  attr_reader :id, :room, :start_date, :end_date, :dates_booked
  
  def initialize(id:, room:, start_date: nil, end_date: nil, dates_booked: nil)
    @id = id
    @room = room
    @start_date = start_date
    @end_date = end_date
    
    @dates_booked = []
    
    unless id.instance_of?(Integer) && id > 0
      raise ArgumentError.new("ID must be a positive integer (got #{id}).")
    end
  end
end
