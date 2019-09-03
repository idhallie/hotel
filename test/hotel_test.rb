require_relative 'test_helper'

describe "Hotel" do
  describe "#initialize" do
    before do
      @new_hotel = Hotel.new()
    end
    
    it "is an instance of Hotel" do
      expect(@new_hotel).must_be_kind_of Hotel
    end
    
    it "contains an array of reservations" do
      expect(@new_hotel.reservations).must_be_kind_of Array
    end
    
    it "contains an array of 20 rooms" do
      expect(@new_hotel.rooms.length).must_equal 20
    end
    
    it "keeps track of reservation instances" do
      reservation_1 = Reservation.new(id: 34, room: 3, start_date: Date.new(2019-10-3), end_date: Date.new(2019-10-6))
      reservation_2 = Reservation.new(id: 35, room: 4, start_date: Date.new(2019-10-7), end_date: Date.new(2019-10-12))
      
      @new_hotel.add_reservation(reservation_1)
      @new_hotel.add_reservation(reservation_2)
      
      expect(@new_hotel.reservations.length).must_equal 2
    end
  end 
  
  describe "find_available_room" do
    
  end
end

