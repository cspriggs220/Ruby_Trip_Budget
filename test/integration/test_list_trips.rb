require_relative '../test_helper'

class TestListingTrips < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_listing_when_there_are_no_trips
    assert Trip.all.empty?
    expected = """
-------------------------------------------
There are no trips to list. Please run `./trip add <trip-name>` to add a trip.\n
-------------------------------------------
"""
    actual = `ruby trip list`
    assert_equal expected, actual
  end

  def test_listing_multiple_trips
    Trip.create( name: 'foo')
    Trip.create( name: 'bar')
    actual = `ruby trip list`
    expected = """
-------------------------------------------
Trip List

1. foo

2. bar
-------------------------------------------
"""
    assert_equal expected, actual
  end
end