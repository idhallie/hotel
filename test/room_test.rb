require_relative 'test_helper'
require 'date'

describe "Room" do
  describe "#initialize" do
    before do
      @new_hotel = HotelSystem::Hotel.new()
      @new_hotel.make_reservation(Date.new(2019-10-3), Date.new(2019-10-6))
      @new_hotel.make_reservation(Date.new(2019-10-7), Date.new(2019-10-12))
      @id = 1
      @new_room = HotelSystem::Room.new(id: @id)
    end
    
    it "is an instance of Room" do
      expect(@new_room).must_be_kind_of HotelSystem::Room
    end
    
    it "stores reservations as an array" do
      expect(@new_hotel.rooms[0].reservations).must_be_kind_of Array
    end
    
    it "holds reservation instances in the array" do
      expect(@new_hotel.rooms[0].reservations[0]).must_be_kind_of HotelSystem::Reservation
    end
    
    it "can keep track of multiple reservations" do
      expect(@new_hotel.rooms[0].reservations.length).must_equal 2
    end
    
    it "keeps track of ID" do
      @new_room.must_respond_to :id
      @new_room.id.must_equal @id
    end
    
    it "requires an integer ID" do
      expect { HotelSystem::Room.new(id: "Not an integer")
      }.must_raise ArgumentError
    end
  end
  
  describe "add_reservation" do
    before do
      @new_hotel = HotelSystem::Hotel.new()
      @new_hotel.make_reservation(Date.new(2019-10-3), Date.new(2019-10-6))
      @new_hotel.make_reservation(Date.new(2019-10-7), Date.new(2019-10-12))
    end
    
    it "can add an additional reservation to the reservations instance variable" do
      @new_hotel.make_reservation(Date.new(2019-10-13), Date.new(2019-10-17))
      
      expect(@new_hotel.rooms[0].reservations.length).must_equal 3
    end
  end
end

