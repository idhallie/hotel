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
  
  describe "date_conflict" do
    before do
      @test_date = DateRange.new(start_date: Date.new(2019, 10, 2), end_date: Date.new(2019, 10, 6))
    end
    
    it "returns true for dates that fall within the range" do
      expect(@test_date.date_conflict(Date.new(2019, 10, 3), Date.new(2019, 10, 5))).must_equal true
    end
    
    it "returns true for the same date range" do
      expect(@test_date.date_conflict(Date.new(2019, 10, 2), Date.new(2019, 10, 6))).must_equal true
    end
    
    it "returns true for a start date that fall within the range and an end date outside the range" do
      expect(@test_date.date_conflict(Date.new(2019, 10, 5), Date.new(2019, 10, 8))).must_equal true
    end
    
    it "returns true for a start date that is before the range and an end date within the range" do
      expect(@test_date.date_conflict(Date.new(2019, 10, 1), Date.new(2019, 10, 3))).must_equal true
    end
    
    it "returns true for dates that fall on either side of the range" do
      expect(@test_date.date_conflict(Date.new(2019, 10, 1), Date.new(2019, 10, 7))).must_equal true
    end
    
    it "returns false for a date ending on the start date" do
      expect(@test_date.date_conflict(Date.new(2019, 9, 30), Date.new(2019, 10, 2))).must_equal false
    end
    
    it "returns false for a date starting on the end date" do
      expect(@test_date.date_conflict(Date.new(2019, 10, 6), Date.new(2019, 10, 10))).must_equal false
    end
    
    it "returns false for a date starting on the end date" do
      expect(@test_date.date_conflict(Date.new(2019, 10, 6), Date.new(2019, 10, 10))).must_equal false
    end
    
    it "returns false for a date starting on the end date" do
      expect(@test_date.date_conflict(Date.new(2019, 9, 20), Date.new(2019, 9, 25))).must_equal false
    end
    
    it "returns false for a date starting on the end date" do
      expect(@test_date.date_conflict(Date.new(2019, 10, 10), Date.new(2019, 10, 15))).must_equal false
    end
  end
end

