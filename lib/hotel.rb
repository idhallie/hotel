require 'date'
require 'pry'

class Hotel
  attr_reader :rooms, :reservations
  
  def initialize(rooms: [], reservations: [])
    @rooms = rooms
    @reservations = reservations
    
    20.times do |i|
      rooms << Room.new(id:(i+1).to_i)
    end
  end
  
  def find_available_rooms(start_date:, end_date:)
    unless start_date.instance_of?(Date) && end_date.instance_of?(Date)
      raise ArgumentError.new("Dates must be entered as a date (ex. yyyy, mm, dd. Got start date: #{start_date} and end_date: #{end_date}.")
    end
    
    available_rooms = []
    # book a room that has no other reservations
    
    rooms.each do |room|
      if room.available(start_date: start_date, end_date: end_date) != nil
        available_rooms << room
      end
    end
    
    if available_rooms.length == 0
      raise ArgumentError.new("There are no available rooms for this date.")
    else
      return available_rooms
    end
  end
  
  def make_reservation(start_date:, end_date:)
    avail_rooms = find_available_rooms(start_date: start_date, end_date: end_date)
    reservation_id = reservations.length + 1
    new_reservation = Reservation.new(id: reservation_id, room: avail_rooms.first, start_date: start_date, end_date: end_date)
    reservations << new_reservation
    avail_rooms.first.add_reservation(new_reservation)
    
    return new_reservation
  end
  
  def room_list
    return rooms
  end
  
  def reservations_by_date(search_date)
    reservation_list = []
    
    reservations.each do |reservation|
      if search_date >= reservation.date_range.start_date && search_date < reservation.date_range.end_date
        reservation_list << reservation
      end
    end
    return reservation_list
  end 
end
