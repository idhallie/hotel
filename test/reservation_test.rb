require_relative 'test_helper'

describe "Reservation" do 
  describe "#initialize" do
    before do
      @id = 1
      @room_1 = HotelSystem::Room.new(id: 2)
      @new_reservation = HotelSystem::Reservation.new(id: @id, room: @room_1, start_date: Date.new(2019, 10, 03), end_date: Date.new(2019, 10, 06))
    end
    
    it "is an instance of Reservation" do
      expect(@new_reservation).must_be_kind_of HotelSystem::Reservation
    end
    
    it "keeps track of ID" do
      @new_reservation.must_respond_to :id
      @new_reservation.id.must_equal @id
    end
    
    it "keeps track of room as an instance" do
      @new_reservation.room.must_be_kind_of HotelSystem::Room
    end
    
    it "requires an integer ID" do
      expect { HotelSystem::Reservation.new(id: "Not an integer", room: @room_1, start_date: Date.new(2019, 10, 03), end_date: Date.new(2019, 10, 06))
      }.must_raise ArgumentError
    end
    
    it "raises an exception if start_date is not in date format" do
      expect { HotelSystem::Reservation.new(id: 1, room: @room_1, start_date: "blerg", end_date: Date.new(2019, 10, 06)) 
      }.must_raise ArgumentError
    end
    
    it "raises an exception if end_date is not in date format" do
      expect { HotelSystem::Reservation.new(id: 1, room: @room_1, start_date: Date.new(2019, 10, 03), end_date: "blorg")
      }.must_raise ArgumentError
    end
    
    it "raises an error if discount is a negative number" do
      expect { @new_reservation = HotelSystem::Reservation.new(id: @id, room: @room_1, start_date: Date.new(2019, 10, 03), end_date: Date.new(2019, 10, 06), discount: -1.1)
      }.must_raise ArgumentError
    end
    
    it "raises an error if discount is greater than 1" do
      expect { @new_reservation = HotelSystem::Reservation.new(id: @id, room: @room_1, start_date: Date.new(2019, 10, 03), end_date: Date.new(2019, 10, 06), discount: 1.1)
      }.must_raise ArgumentError
    end
    
    it "raises an error if discount is not a Float" do
      expect { @new_reservation = HotelSystem::Reservation.new(id: @id, room: @room_1, start_date: Date.new(2019, 10, 03), end_date: Date.new(2019, 10, 06), discount: "Not a Float")
      }.must_raise ArgumentError
    end
    
    it "it raises an error if block_res_taken is not nil or a boolean" do
      expect { @new_reservation = HotelSystem::Reservation.new(id: @id, room: @room_1, start_date: Date.new(2019, 10, 03), end_date: Date.new(2019, 10, 06), discount: 0.1, block_res_taken: "blerg")
      }.must_raise ArgumentError
    end
  end
  
  describe "total_cost" do
    before do
      @id = 1
      @room_1 = HotelSystem::Room.new(id: 2)
      @booked_dates = HotelSystem::DateRange.new(start_date: Date.new(2019, 10, 03), end_date: Date.new(2019, 10, 06))
      @new_reservation = HotelSystem::Reservation.new(id: @id, room: @room_1, start_date: Date.new(2019, 10, 03), end_date: Date.new(2019, 10, 06))
    end
    
    it "calculates total cost of the reservation" do
      expect(@new_reservation.total_cost).must_equal 600
    end
    
    it "correctly calculates a block discount" do
      reservation2 = HotelSystem::Reservation.new(id: @id, room: @room_1, start_date: Date.new(2019, 10, 03), end_date: Date.new(2019, 10, 06), discount: 0.2)
      
      expect(reservation2.total_cost).must_equal 480
    end
    
    it "correctly calculates a discount of 1 (free room)" do
      reservation3 = HotelSystem::Reservation.new(id: @id, room: @room_1, start_date: Date.new(2019, 10, 03), end_date: Date.new(2019, 10, 06), discount: 1.0)
      
      expect(reservation3.total_cost).must_equal 0
    end
  end
  
  describe "change_block_status" do
    before do
      @new_hotel = HotelSystem::Hotel.new()
      @new_block = @new_hotel.make_block(start_date: Date.new(2019, 10, 03), end_date: Date.new(2019, 10, 06), num_rooms: 4, discount: 1.0)
    end
    
    it "will change block_res_taken to true once booked" do
      room_booked = @new_block.book_it
      
      expect(room_booked.block_res_taken).must_equal true
    end
  end
end

