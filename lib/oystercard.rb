class Oystercard

  attr_reader :balance
  
  MaxBalance = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "You cannot exceed a balance of #{MaxBalance}" if @balance + amount >= MaxBalance
    @balance += amount
  end

end
