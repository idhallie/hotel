require 'date'
require 'pry'

class Room
  attr_reader :id, :reservations, :date_range
  
  def initialize(id:, reservations: [], date_range: [])
    @id = id
    @reservations = reservations
    @date_range = date_range
    
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
  
  def available(start_date:, end_date:)
    # If no date ranges in array, return true
    # For each date_range element
    # if date_range.date_conflict == false, return true
    # end for loop
    # return false
  end
end
