require 'date'

class Reservation
  attr_reader :id, :room, :start_date, :end_date, :dates_booked
  
  def initialize(id:, room: nil, start_date:, end_date:, dates_booked: [])
    @id = id
    @room = room
    @start_date = start_date
    @end_date = end_date
    @dates_booked = dates_booked
    
    unless id.instance_of?(Integer) && id > 0
      raise ArgumentError.new("ID must be a positive integer (got #{id}).")
    end
    
    unless start_date.instance_of?(Date) && end_date.instance_of?(Date)
      raise ArgumentError.new("Start date must be entered as a date (ex. yyyy, mm, dd. Got start date: #{start_date} and end_date: #{end_date}.")
    end
    
    #   def add_dates(start_date, end_date)
    #     this_date = start_date
    #     while this_date < end_date
    #       dates_booked << this_date
    #       this_date += 1
    #     end
    #   end
    
    #   add_dates(start_date, end_date)
  end
end
