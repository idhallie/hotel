require 'date'
require 'pry'

class Block
  attr_reader :id, :reservations
  
  def initialize(id:, reservations: [])
    @id = id
    @reservations = reservations
  end
  
  def rooms_available
    avail_block_rooms = []
    
    reservations.each do |reservation|
      if reservation.block_res_taken == false
        avail_block_rooms << reservation
      end
    end
    
    if avail_block_rooms == 0
      raise ArgumentError.new("All rooms in this block are reserved.")
    end
    
    return avail_block_rooms
  end
  
  def book_it
    bookable_rooms = rooms_available
    
    bookable_rooms.first.change_block_status
    
    return bookable_rooms.first
  end
end
