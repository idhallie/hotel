require 'date'

module HotelSystem
  class Room
    attr_reader :id, :reservations
    
    def initialize(id:, reservations: [])
      @id = id
      @reservations = reservations
      
      unless id.instance_of?(Integer) && id > 0
        raise ArgumentError.new("ID must be a positive integer (got #{id}).")
      end
    end
    
    def add_reservation(reservation)
      reservations << reservation
    end
    
    def available(start_date, end_date)
      if reservations.length == 0
        return true
      end
      
      reservations.each do |reservation|
        if reservation.date_range.date_conflict(start_date, end_date) == false
          return true
        end
      end
      return false
    end
  end
end
