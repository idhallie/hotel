require 'date'
require 'pry'

class Block
  attr_reader :id, :reservations
  
  def initialize(id:, reservations: [])
    @id = id
    @reservations = reservations
  end
  
  #method to take one of the held rooms
  
  def rooms_available
    avail_block_rooms = []
    
    reservations.each do |reservation|
      if reservation.block_res_taken == false
        avail_block_rooms << reservations
      end
    end
    
    return avail_block_rooms
  end
end
