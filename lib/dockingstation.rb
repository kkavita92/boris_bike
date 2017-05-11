require_relative 'bike'

class DockingStation

  attr_reader :bikes
  attr_accessor  :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail("No bikes left") if empty?
    working_bikes = []
    @bikes.each do |bike|
      working_bikes << bike unless bike.broken?
    end
    fail("No working bikes available") if working_bikes.empty?
    working_bike = working_bikes.pop
    @bikes.delete(working_bike)
    working_bike
  end

  def dock(bike) #docks a bike instance
    fail("No spaces left") if full? #error if bike already has been docked
    @bikes.push(bike) #saves docked bike into memory so we can see it later
  end


  private

  def full?
    @bikes.count >= capacity
  end

  def empty?
    @bikes.empty?
  end

end
