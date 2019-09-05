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
  end
end
