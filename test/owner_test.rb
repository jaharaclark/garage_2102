require 'minitest/autorun'
require 'minitest/pride'
require './lib/car'
require './lib/owner'

class Test < Minitest::Test
  def setup
    @owner_1 = Owner.new('Regina George', 'Heiress')
  end

  def test_it_exists
    assert_instance_of Owner, @owner_1
  end

  def test_it_has_attributes
    assert_equal "Regina George", @owner_1.name
    assert_equal "Heiress", @owner_1.occupation
    assert_equal [], @owner_1.cars
  end

  def test_it_can_buy_cars
    @owner_1.buy('1967 Green Ford Mustang')

    assert_equal [({:make=>"Ford", :model=>"Mustang", :color=>"Green", :year=>"1967", :age=>54})], @owner_1.cars

    @owner_1.buy('2001 Silver BMW 3-Series')

    assert_equal [({:make=>"Ford", :model=>"Mustang", :color=>"Green", :year=>"1967", :age=>54}), ({:make=>"BMW", :model=>"3-Series", :color=>"Silver", :year=>"2001", :age=>20})], @owner_1.cars

    @owner_1.buy('1963 Red Chevrolet Corvette')
  end

  def test_it_has_vintage_cars
    @owner_1.buy('1967 Green Ford Mustang')
    @owner_1.buy('2001 Silver BMW 3-Series')
    @owner_1.buy('1963 Red Chevrolet Corvette')
    
    assert_equal [({:make=>"Ford", :model=>"Mustang", :color=>"Green", :year=>"1967", :age=>54}),({:make=>"Chevrolet", :model=>"Corvette", :color=>"Red", :year=>"1963", :age=>58})], @owner_1.vintage_cars
  end
end