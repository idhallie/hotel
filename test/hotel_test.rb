require_relative 'test_helper'
require 'date'

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
    
    # it "books the first available room" do
    
    # end
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
  
  describe "make_reservation" do
    before do
      @new_hotel = Hotel.new()
      @reservation_1 = @new_hotel.make_reservation(start_date: Date.new(2010, 10, 01), end_date: Date.new(2010, 10, 04))
    end
    
    it "adds new reservation to @reservation instance variable (array)" do
      expect(@new_hotel.reservations.last).must_equal @reservation_1
    end
    
    it "creates an instance of Reservation" do
      expect(@reservation_1).must_be_kind_of Reservation
    end
  end
  
  describe "reservations_by_date" do
    before do
      @new_hotel = Hotel.new()
      @new_hotel.make_reservation(start_date: Date.new(2010, 10, 01), end_date: Date.new(2010, 10, 04))
      @new_hotel.make_reservation(start_date: Date.new(2010, 9, 30), end_date: Date.new(2010, 10, 02))
      @new_hotel.make_reservation(start_date: Date.new(2010, 9, 30), end_date: Date.new(2010, 10, 06))
      @new_hotel.make_reservation(start_date: Date.new(2010, 10, 02), end_date: Date.new(2010, 10, 05))
    end
    
    it "can track the correct number of reservations for a date" do
      search = @new_hotel.reservations_by_date(Date.new(2010, 10, 02))
      
      expect(search.length).must_equal 3
    end
    
    it "returns an array" do
      expect(@new_hotel.reservations_by_date(Date.new(2010, 10, 02))).must_be_kind_of Array
    end
    
    it "returns an empty array if nothing is found" do
      search = @new_hotel.reservations_by_date(Date.new(2010, 10, 30))
      
      expect(search.length).must_equal 0
    end
  end
end  
