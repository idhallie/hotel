require 'date'
require 'pry'

class Room
  attr_reader :id, :reservations, :room_cost, :dates_booked
  
  def initialize(id, reservations: [], dates_booked: [])
    @id = id
    @reservations = reservations
    @dates_booked = dates_booked
    
    unless id.instance_of?(Integer) && id > 0
      raise ArgumentError.new("ID must be a positive integer (got #{id}).")
    end
  end
  
  def add_reservation(reservation)
    reservations << reservation
  end
  
  def add_dates(reservation)
    this_date = reservation.start_date
    while this_date < reservation.end_date
      dates_booked << this_date
      this_date += 1
    end
  end
end
