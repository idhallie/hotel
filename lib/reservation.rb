require 'date'

class Reservation
  attr_reader :id, :room, :start_date, :end_date, :discount, :date_range, :block_res_taken
  
  def initialize(id:, room: nil, start_date:, end_date:, discount: 0.0, block_res_taken: nil)
    @id = id
    @room = room
    @start_date = start_date
    @end_date = end_date
    @discount = discount
    @block_res_taken = block_res_taken
    
    @date_range = DateRange.new(start_date: start_date, end_date: end_date)
    
    unless id.instance_of?(Integer) && id > 0
      raise ArgumentError.new("ID must be a positive integer (got #{id}).")
    end
    
    unless discount.instance_of?(Float) && (discount >= 0 && discount <=1)
      raise ArgumentError.new("Discount must be a positive integer (got #{discount}).")
    end
  end
  
  def total_cost
    return (date_range.end_date - date_range.start_date) * (200 * (1 - discount))
  end
  
  def change_block_status
    @block_res_taken = true
  end
end
