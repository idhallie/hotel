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
      expect { Reservation.new("Not an integer", @room1, start_date: Date.new(2019-10-3), end_date: Date.new(2019-10-6))
      }.must_raise ArgumentError
    end
    
    # start_date must be an instance of Date
    # end_date must be an instance of Date
  end
  
  # describe "#initialize validation" do
  
  # end
end
