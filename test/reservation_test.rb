require_relative 'test_helper'

describe "Reservation" do 
  describe "#initialize" do
    before do
      @id = 1
      @room_1 = Room.new(id: 2)
      #@booked_dates = DateRange.new(start_date: Date.new(2019, 10, 03), end_date: Date.new(2019, 10, 06))
      @new_reservation = Reservation.new(id: @id, room: @room_1, start_date: Date.new(2019, 10, 03), end_date: Date.new(2019, 10, 06))
    end
    
    it "is an instance of Reservation" do
      expect(@new_reservation).must_be_kind_of Reservation
    end
    
    it "keeps track of ID" do
      @new_reservation.must_respond_to :id
      @new_reservation.id.must_equal @id
    end
    
    it "keeps track of room as an instance" do
      @new_reservation.room.must_be_kind_of Room
    end
    
    it "requires an integer ID" do
      expect { Reservation.new(id: "Not an integer", room: @room_1, start_date: Date.new(2019, 10, 03), end_date: Date.new(2019, 10, 06))
      }.must_raise ArgumentError
    end
  end
  
  describe "total_cost" do
    before do
      @id = 1
      @room_1 = Room.new(id: 2)
      @booked_dates = DateRange.new(start_date: Date.new(2019, 10, 03), end_date: Date.new(2019, 10, 06))
      @new_reservation = Reservation.new(id: @id, room: @room_1, start_date: Date.new(2019, 10, 03), end_date: Date.new(2019, 10, 06))
    end
    
    it "calculates total cost of the reservation" do
      expect(@new_reservation.total_cost).must_equal 600
    end
  end
end
