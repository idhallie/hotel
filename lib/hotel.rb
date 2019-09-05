require 'date'
require 'pry'

class Hotel
  attr_reader :rooms, :reservations
  
  def initialize(rooms: [], reservations: [])
    @rooms = rooms
    @reservations = reservations
    
    20.times do |i|
      rooms << Room.new((i+1).to_i)
    end
  end
  
  def find_available_room(start_date, end_date)
    rooms.each do |room|
      if room.dates_booked.length == 0
        return room
      end
    end
  end
  
  def make_reservation(start_date:, end_date:)
    # room = find_available_room(start_date, end_date)
    reservation_id = reservations.length + 1
    new_reservation = Reservation.new(id: reservation_id, start_date: start_date, end_date: end_date)
    reservations << new_reservation
    # room.add_reservation(new_reservation)
    # room.add_dates(new_reservation)
    
    return new_reservation
  end
  
  def room_list
    return rooms
  end
  
  def reservations_by_date(search_date)
    reservation_list = []
    
    reservations.each do |reservation|
      if search_date >= reservation.start_date && search_date < reservation.end_date
        reservation_list << reservation
      end
    end
    return reservation_list
  end 
end
