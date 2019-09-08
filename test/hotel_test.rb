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
  end 
  
  describe "find_available_rooms" do
    before do
      @new_hotel = Hotel.new()
      @search = @new_hotel.find_available_rooms(start_date: Date.new(2019-10-3), end_date: Date.new(2019-10-6))
    end
    
    it "returns an array" do
      expect(@search).must_be_kind_of Array
    end
    
    it "raises an error if start_date is not a Date" do
      expect { @new_hotel.find_available_rooms(start_date: "blerg", end_date: Date.new(2019, 10, 06))
      }.must_raise ArgumentError
    end
    
    it "raises an error if end_date is not a Date" do
      expect { @new_hotel.find_available_rooms(start_date: Date.new(2019, 10, 03), end_date: "blorb")
      }.must_raise ArgumentError
    end
    
    it "returns available rooms" do
      @new_hotel.make_reservation(start_date: Date.new(2010, 10, 2), end_date: Date.new(2010, 10, 4))
      @new_hotel.make_reservation(start_date: Date.new(2010, 10, 2), end_date: Date.new(2010, 10, 4))
      @new_hotel.make_reservation(start_date: Date.new(2010, 10, 2), end_date: Date.new(2010, 10, 4))
      search2 = @new_hotel.find_available_rooms(start_date: Date.new(2010, 10, 02), end_date: Date.new(2010, 10, 03))
      
      expect(search2.length).must_equal 17
    end
    
    it "raises an exception if there are no available rooms on that date" do
      20.times do
        @new_hotel.make_reservation(start_date: Date.new(2010, 10, 2), end_date: Date.new(2010, 10, 4))
      end
      
      expect { @new_hotel.make_reservation(start_date: Date.new(2010, 10, 2), end_date: Date.new(2010, 10, 4))
      }.must_raise ArgumentError
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
    
    it "raises an error if start_date is not a Date" do
      expect { DateRange.new(start_date: "blerg", end_date: Date.new(2019, 10, 06))
      }.must_raise ArgumentError
    end
    
    it "raises an error if end_date is not a Date" do
      expect { DateRange.new(start_date: Date.new(2019, 10, 03), end_date: "blorb")
      }.must_raise ArgumentError
    end
  end
  
  
  describe "reservations_by_date" do
    before do
      @new_hotel = Hotel.new()
      @new_hotel.make_reservation(start_date: Date.new(2019, 10, 01), end_date: Date.new(2019, 10, 04))
      @new_hotel.make_reservation(start_date: Date.new(2019, 9, 30), end_date: Date.new(2019, 10, 02))
      @new_hotel.make_reservation(start_date: Date.new(2019, 9, 30), end_date: Date.new(2019, 10, 06))
      @new_hotel.make_reservation(start_date: Date.new(2019, 10, 02), end_date: Date.new(2019, 10, 05))
    end
    
    it "can track the correct number of reservations for a date" do
      search = @new_hotel.reservations_by_date(Date.new(2019, 10, 02))
      
      expect(search.length).must_equal 3
    end
    
    it "returns an array" do
      expect(@new_hotel.reservations_by_date(Date.new(2019, 10, 02))).must_be_kind_of Array
    end
    
    it "returns an empty array if nothing is found" do
      search = @new_hotel.reservations_by_date(Date.new(2019, 10, 30))
      
      expect(search.length).must_equal 0
    end
    
    it "displays resevations held for a block in the list of reservations for a given date." do
      @new_block = @new_hotel.make_block(start_date: Date.new(2019, 10, 1), end_date: Date.new(2019, 10, 5), num_rooms: 5, discount: 0.1)
      search = @new_hotel.reservations_by_date(Date.new(2019, 10, 02))
      
      expect(search.length).must_equal 8
    end
  end
  
  describe "make_block" do
    before do
      @new_hotel = Hotel.new()
      @new_block = @new_hotel.make_block(start_date: Date.new(2019, 10, 3), end_date: Date.new(2019, 10, 5), num_rooms: 5, discount: 0.1)
    end
    
    it "is an instance of Block" do
      expect(@new_block).must_be_kind_of Block
    end
    
    it "will raise an exception if one or more rooms is unavailable for the date range." do 
      hotel_one = Hotel.new()
      
      17.times do
        hotel_one.make_reservation(start_date: Date.new(2019, 10, 2), end_date: Date.new(2019, 10, 4))
      end
      
      expect { hotel_one.make_block(start_date: Date.new(2019, 10, 2), end_date: Date.new(2019, 10, 4), num_rooms: 5, discount: 0.1)
      }.must_raise ArgumentError
    end
    
    it "cannot reserve a room for a specific date that is held for a block" do
      block_rooms = []
      @new_block.reservations.each do |reservation|
        block_rooms << reservation.room
      end
      
      available_rooms = @new_hotel.find_available_rooms(start_date:Date.new(2019, 10, 3), end_date: Date.new(2019, 10, 5))
      array_comparison = block_rooms.all? { |room| available_rooms.include?(room) }
      
      expect(array_comparison).must_equal false
    end
    
    it "raises an error if the user tries to reserve more than 5 rooms" do
      expect { @new_hotel.make_block(start_date: Date.new(2019, 10, 3), end_date: Date.new(2019, 10, 5), num_rooms: 6, discount: 0.1)
      }.must_raise ArgumentError
    end
  end
end
