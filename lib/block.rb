require 'date'
require 'pry'

class Block
  attr_reader :id, :reservations
  
  def initialize(id:, reservations: [])
    @id = id
    @reservations = reservations
  end
  
  # Wave 3: check if a block has rooms available
  def rooms_available
    avail_block_reservations = []
    
    reservations.each do |reservation|
      if reservation.block_res_taken == false
        avail_block_reservations << reservation
      end
    end
    
    if avail_block_reservations.length == 0
      raise AvailabilityError.new("All rooms in this block are reserved.")
    end
    
    return avail_block_reservations
  end
  
  # Wave 3: reserve a room from a block
  def book_it
    unclaimed_reservation = rooms_available
    
    unclaimed_reservation.first.change_block_status
    
    return unclaimed_reservation.first
  end
end


class AvailabilityError < StandardError
end
