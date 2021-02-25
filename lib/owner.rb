require './lib/car'

class Owner
  attr_reader :name, :occupation, :cars, :make, :model, :color, :year, :age
  
  def initialize(name, occupation)
    @name = name
    @occupation = occupation
    @cars = []
  end

  def buy(the_car)
    car_hash = {
      :make => the_car.split[2],
      :model => the_car.split[3],
      :color => the_car.split[1],
      :year => the_car.split[0],
      :age => 2021 - (the_car.split[0].to_i)
    }
    @cars << car_hash
  end

  def vintage_cars
    @cars.find_all do |car|
      car[:age] >= 25
    end
  end
end