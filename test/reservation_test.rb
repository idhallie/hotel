require_relative 'test_helper'

describe "Reservation" do 
  describe "#initialize" do
    before do
      @id = 1
      @room_1 = Room.new(2)
      @new_reservation = Reservation.new(id: @id, room: @room_1, start_date: Date.new(2019-10-3), end_date: Date.new(2019-10-6))
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
      expect { Reservation.new("Not an integer", room: @room_1, start_date: Date.new(2019-10-3), end_date: Date.new(2019-10-6))
      }.must_raise ArgumentError
    end
    
    it "requires that start_date must be an instance of Date class" do
      expect(@new_reservation.start_date).must_be_kind_of Date
    end
    
    it "requires that end_date must be an instance of Date class" do
      expect(@new_reservation.start_date).must_be_kind_of Date
    end
    
    it "raises an error if start_date is not a Date" do
      expect { Reservation.new(id: @id, room: @room_1, start_date: "blerg", end_date: Date.new(2019-10-6))
      }.must_raise ArgumentError
    end
    
    it "raises an error if end_date is not a Date" do
      expect { Reservation.new(id: @id, room: @room_1, start_date: Date.new(2019-10-3), end_date: "blorb")
      }.must_raise ArgumentError
    end
  end
  
  # describe "#initialize validation" do
  
  # end
end
