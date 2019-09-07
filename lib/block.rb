require 'date'
require 'pry'

class Block
  attr_reader :id, :reservations
  
  def initialize(id:, reservations: [])
    @id = id
    @reservations = reservations
  end
  
  #method to take one of the held rooms
end
