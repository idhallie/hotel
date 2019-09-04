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
    
    # it "keeps track of reservation instances" do
    #   reservation_1 = Reservation.new(id: 34, room: 3, start_date: Date.new(2019-10-3), end_date: Date.new(2019-10-6))
    #   reservation_2 = Reservation.new(id: 35, room: 4, start_date: Date.new(2019-10-7), end_date: Date.new(2019-10-12))
    
    #   @new_hotel.add_reservation(reservation_1)
    #   @new_hotel.add_reservation(reservation_2)
    
    #   expect(@new_hotel.reservations.length).must_equal 2
    # end
  end 
  
  describe "find_available_room" do
    before do
      @new_hotel = Hotel.new()
    end
    
    it "books a room if the dates_booked array is empty" do
      room = @new_hotel.rooms.first
      expect(@new_hotel.find_available_room(Date.new(2019, 10, 7), Date.new(2019, 10, 12))).must_equal room
    end
  end
  
  describe "room_list" do
    before do
      @new_hotel = Hotel.new()
    end
    
    it "will display a list of all rooms" do
      expect(@new_hotel.room_list.length).must_equal 20
    end
    
    it "includes the first room" do
      expect(@new_hotel.room_list.first.id).must_equal 1
    end
    
    it "includes the last room" do
      expect(@new_hotel.room_list.last.id).must_equal 20
    end
  end
end

