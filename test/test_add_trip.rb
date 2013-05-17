require 'test_helper'

class TestAddingTrip < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_takes_arguments_and_saves_them
    assert_equal 0, Trip.count
    puts `ruby trip add foo`
    assert_equal 1, Trip.count
  end

  def test_takes_arguments_and_uses_them
    puts `ruby trip add foo`
    assert_equal 'foo', Trip.last.name
  end
end

