require 'date'
require 'pry'

class Room
  attr_reader :id, :reservations, :date_range
  
  def initialize(id:, reservations: [], date_range: [])
    @id = id
    @reservations = reservations
    @date_range = date_range #possibly remove this
    
    unless id.instance_of?(Integer) && id > 0
      raise ArgumentError.new("ID must be a positive integer (got #{id}).")
    end
  end
  
  def add_reservation(reservation)
    reservations << reservation
  end
  
  # def add_dates(reservation)
  # end
  
  def available(start_date:, end_date:)
    # If no date ranges in array, return true
    if reservations.length == 0
      return true
    end
    
    # For each date_range element
    reservations.each do |reservation|
      # if date_range.date_conflict == false, return true
      if reservation.date_range.date_conflict(comp_start_date: start_date, comp_end_date: end_date) == false
        return id
      end
      # end for loop
      return nil
    end
  end
end
