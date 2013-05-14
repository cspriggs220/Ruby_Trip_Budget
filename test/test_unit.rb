require 'test_helper'

class TestAddingBudget < Test::Unit::TestCase
  def test_takes_arguments_and_saves_them
    # start with no trips
    assert_equal Trip.count, 0
    # `ruby trip add foo`
    Trip.create( name: 'foo' )
    # end up with a 'foo' trip
    assert_equal Trip.count, 1
  end

end

