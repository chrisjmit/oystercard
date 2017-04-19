class Oystercard

  attr_reader :balance, :max_balance

  def initialize
    @balance = 0
    @max_balance = 90
  end

  def top_up(amount)
    raise "You cannot exceed a balance of #@max_balance" if @balance + amount >= @max_balance
    @balance += amount
  end

end
