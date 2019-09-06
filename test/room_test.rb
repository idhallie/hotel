require_relative 'test_helper'
require 'date'

describe "Room" do
  describe "#initialize" do
    before do
      @id = 2
      @new_room = Room.new(id: @id)
    end
    
    it "is an instance of Room" do
      expect(@new_room).must_be_kind_of Room
    end
    
    # it "can keep track of reservations" do
    #   reservation_1 = Reservation.new(id: 34, room: 3, start_date: Date.new(2019-10-3), end_date: Date.new(2019-10-6))
    #   reservation_2 = Reservation.new(id: 34, room: 4, start_date: Date.new(2019-10-7), end_date: Date.new(2019-10-12))
    
    #   expect(@new_room.reservations.length).must_equal 2
    # end
    
    it "keeps track of ID" do
      @new_room.must_respond_to :id
      @new_room.id.must_equal @id
    end
    
    it "requires an integer ID" do
      expect { Room.new("Not an integer")
      }.must_raise ArgumentError
    end
  end
  
  describe "available" do
    it "returns true if there are no other dates booked" do
    end
    
  end
end

