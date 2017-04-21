require './lib/station'
require './lib/journey'

class Oystercard

  attr_reader :balance, :entry_station, :exit_station, :journeys, :journey

  MaxBalance = 90
  MinBalance = 1
  MinFare = 1

  def initialize
    @balance = 0
    @journeys = []
        @journey = Journey.new
  end

  def top_up(amount)
    raise "You cannot exceed a balance of #{MaxBalance}" if @balance + amount > MaxBalance
    @balance += amount
  end

  def touch_in(entry_station)
    fail "Your balance is below #{MinBalance} so you cannot travel" if @balance < MinBalance
    @entry_station = entry_station
    @journey.start(entry_station)
  end

  def touch_out(station)
  	deduct(MinFare)
    @entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
