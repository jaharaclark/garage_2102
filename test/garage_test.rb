require 'minitest/autorun'
require 'minitest/pride'
require './lib/car'
require './lib/owner'
require './lib/garage'

class Test < Minitest::Test
  def setup
    @garage = Garage.new('Totally Safe Parking')
    @owner_1 = Owner.new('Regina George', 'Heiress')
    @owner_2 = Owner.new('Glen Coco', 'Unknown')
  end

  def test_it_exists
    assert_instance_of Garage, @garage
  end

  def test_it_has_attributes
    assert_equal 'Totally Safe Parking', @garage.name
  end

  def test_garage_can_have_customers
    @owner_1.buy('1967 Green Ford Mustang')
    @owner_1.buy('2001 Blue Ford Escape')
    @owner_2.buy('1963 Green Chevrolet Corvette')
    @owner_2.buy('2020 Silver Volvo XC90')

    @garage.name = 'Totally Safe Garage'
    assert_equal 'Totally Safe Garage', @garage.name

    @garage.add_customer(@owner_1)
    @garage.add_customer(@owner_2)

    @garage.customers
  end
end