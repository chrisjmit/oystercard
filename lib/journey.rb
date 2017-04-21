class Journey

  attr_reader :array

  def initialize
    @array = []
  end

  def start(entry_station)
    array << entry_station
  end

  def finish(exit_station)
    array << exit_station
    @journeys << @array
  end
end
