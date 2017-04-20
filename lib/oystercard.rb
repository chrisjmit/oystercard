class Oystercard

  attr_reader :balance, :in_use, :entry_station
  
  MaxBalance = 90
  MinBalance = 1
  MinFare = 1

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(amount)
    raise "You cannot exceed a balance of #{MaxBalance}" if @balance + amount >= MaxBalance
    @balance += amount
  end

  def touch_in(station = 'station')
    fail "Your balance is below #{MinBalance} so you cannot travel" if @balance < MinBalance
  	@in_use = true
  	@entry_station = station
  end

  def touch_out
  	@in_use = false
  	@entry_station = nil
  	deduct(MinFare)
  end

  def in_journey?
  	if @entry_station == nil 
  	  return false
  	else
  	  return true
  	end
  end
  
  private
  
  def deduct(amount)
    @balance -= amount
  end

end
