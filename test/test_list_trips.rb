require 'test_helper'

class TestListingTrips < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_listing_when_there_are_no_trips
    assert Trip.all.empty?
    actual = `ruby trip list`
    assert_equal "", actual
  end

  def test_listing_multiple_trips
    Trip.create( name: 'foo')
    Trip.create( name: 'bar')
    actual = `ruby trip list`
    expected = <<EOS
1. foo
2. bar
EOS
    assert_equal expected, actual
  end
end