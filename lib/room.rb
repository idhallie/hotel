require 'date'

class Room
  attr_reader :id, :reservations, :room_cost, :dates_booked
  
  def initialize(id, reservations: nil, dates_booked: nil)
    @id = id
    @reservations = []
    @dates_booked = []
    
    unless id.instance_of?(Integer) && id > 0
      raise ArgumentError.new("ID must be a positive integer (got #{id}).")
    end
  end
  
  def add_reservation(reservation)
    @reservations << reservation
  end
end
