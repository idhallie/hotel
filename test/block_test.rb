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
  
  describe "rooms available" do
    before do
      @new_hotel = Hotel.new()
      @new_block = @new_hotel.make_block(start_date: Date.new(2019, 10, 3), end_date: Date.new(2019, 10, 5), num_rooms: 5, discount: 0.1)
    end
    
    it "returns an array" do
      expect(@new_block.rooms_available).must_be_kind_of Array
    end
    
    it "raises an exception if there are no rooms available" do
      #run book_it five times
    end
    
  end
  
  describe "book_it" do
    before do
      @new_hotel = Hotel.new()
      @new_block = @new_hotel.make_block(start_date: Date.new(2019, 10, 3), end_date: Date.new(2019, 10, 5), num_rooms: 5, discount: 0.1)
    end
    
    it "can reduce the number of available rooms when one is booked" do 
      @new_block.book_it
      
      expect(@new_block.rooms_available.length).must_equal 4
    end
    
    it "returns the instance of the booked room" do 
      expect(@new_block.book_it).must_be_kind_of Reservation
      
    end
  end
end
