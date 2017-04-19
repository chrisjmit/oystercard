class Oystercard

  attr_reader :balance, :in_use
  
  MaxBalance = 90
  MinBalance = 1

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(amount)
    raise "You cannot exceed a balance of #{MaxBalance}" if @balance + amount >= MaxBalance
    @balance += amount
  end
  
  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    fail "Your balance is below #{MinBalance} so you cannot travel" if @balance < MinBalance
  	@in_use = true
  end

  def touch_out
  	@in_use = false
  end

  def in_journey?
  	@in_use
  end

end
