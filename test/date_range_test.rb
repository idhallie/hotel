require_relative 'test_helper'
require 'date'

describe "DateRange" do
  describe "#initialize" do
    before do
      @new_date = DateRange.new(start_date: Date.new(2019, 10, 02), end_date: Date.new(2019, 10, 06))
    end
    
    it "is an instance of DateRange" do
      expect(@new_date).must_be_kind_of DateRange
    end
    
    it "requires that start_date must be an instance of Date class" do
      expect(@new_date.start_date).must_be_kind_of Date
    end
    
    it "requires that end_date must be an instance of Date class" do
      expect(@new_date.start_date).must_be_kind_of Date
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
end
