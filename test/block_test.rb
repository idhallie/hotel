require_relative 'test_helper'
require 'date'

describe "Block" do
  describe "#initialize" do
    before do
      @new_hotel = Hotel.new()
      @new_block = @new_hotel.make_block(start_date: Date.new(2019, 10, 3), end_date: Date.new(2019, 10, 5), num_rooms: 5, discount: 0.1)
    end
    
    it "is an instance of Block" do
      expect(@new_block).must_be_kind_of Block
    end
    
    it "stores a number of reservations as an array" do
      expect(@new_block.reservations).must_be_kind_of Array
    end
    
    it "holds reservation instances in the reservations array" do
    end
    
  end
  
  
end
