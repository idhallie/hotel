require 'date'
require 'pry'

class Hotel
  attr_reader :rooms, :reservations
  
  def initialize(rooms: nil, reservations: nil)
    @rooms = []
    @reservations = []
    
    20.times do |i|
      @rooms << (i+1).to_i
    end
  end
  
  def find_available_room(start_date, end_date)
    
    #return room instance
  end
  
  def make_reservation(start_date, end_date)
    # room = find_available_room(start_date, end_date)
    reservation_id = @reservations.length + 1
    new_reservation = Reservation.new(reservation_id, room, start_date: start_date, end_date: end_date)
    # reservations << new_reservation
    # room.add_reservation(new_reservation)
  end
end
