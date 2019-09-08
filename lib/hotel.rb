require 'date'
require 'pry'

class Hotel
  attr_reader :rooms, :reservations, :blocks
  
  def initialize(rooms: [], reservations: [], blocks: [])
    @rooms = rooms
    @reservations = reservations
    @blocks = blocks
    
    20.times do |i|
      rooms << Room.new(id:(i+1).to_i)
    end
  end
  
  # Wave 2: View available rooms for a given date range
  def find_available_rooms(start_date:, end_date:)
    unless start_date.instance_of?(Date) && end_date.instance_of?(Date)
      raise ArgumentError.new("Dates must be entered as a date (ex. yyyy, mm, dd. Got start date: #{start_date} and end_date: #{end_date}.")
    end
    
    available_rooms = []
    
    rooms.each do |room|
      if room.available(start_date: start_date, end_date: end_date) == true
        available_rooms << room
      end
    end
    
    if available_rooms.length == 0
      raise ArgumentError.new("There are no available rooms for this date.")
    else
      return available_rooms
    end
  end
  
  # Wave 1: Reserve a room given a date range
  def make_reservation(start_date:, end_date:)
    avail_rooms = find_available_rooms(start_date: start_date, end_date: end_date)
    reservation_id = reservations.length + 1
    new_reservation = Reservation.new(id: reservation_id, room: avail_rooms.first, start_date: start_date, end_date: end_date)
    reservations << new_reservation
    avail_rooms.first.add_reservation(new_reservation)
    
    return new_reservation
  end
  
  # Wave 3: create a block of rooms
  def make_block(start_date:, end_date:, num_rooms:, discount:)
    block_avail_rooms = find_available_rooms(start_date: start_date, end_date: end_date) 
    
    if block_avail_rooms.length < num_rooms
      raise ArgumentError.new("There are not enough rooms available for this block reservation.")
    end 
    
    if num_rooms > 5
      raise ArgumentError.new("The maximum number of rooms allowed in a block is 5. Number entered: #{num_rooms}.")
    end
    
    block_res_array = []
    
    num_rooms.times do |count|
      reservation_id = reservations.length + 1
      block_reservation = Reservation.new(id: reservation_id, room: block_avail_rooms[count], start_date: start_date, end_date: end_date, discount: discount, block_res_taken: false)
      block_res_array << block_reservation
      reservations << block_reservation
      
      block_avail_rooms[count].add_reservation(block_reservation)
    end
    
    block_id = blocks.length + 1
    
    new_block = Block.new(id: block_id, reservations: block_res_array)
    blocks << new_block
    
    return new_block
  end
  
  # Wave 1: List reservations for a given date
  def reservations_by_date(search_date)
    reservation_list = []
    
    reservations.each do |reservation|
      if search_date >= reservation.date_range.start_date && search_date < reservation.date_range.end_date
        reservation_list << reservation
      end
    end
    return reservation_list
  end 
  
  #  Wave 1: List Rooms
  def room_list
    return rooms
  end
end
