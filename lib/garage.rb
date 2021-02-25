class Garage
  attr_reader :name, :customers
  
  def initialize(name)
    @name = name
  end

  def add_customer(customer)
    customers = []
    customers << customer
  end
  
end