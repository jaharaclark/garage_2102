class Car
  attr_reader :make, :model, :color, :year, :age
  
  def initialize(vehicle)
    @make = vehicle[:description].split[1]
    @model = vehicle[:description].split[2]
    @color = vehicle[:description].split[0]
    @year = vehicle[:year]
    @age = 2021 - (vehicle[:year].to_i)
  end
  
end