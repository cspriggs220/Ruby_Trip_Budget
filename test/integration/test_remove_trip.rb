require_relative '../test_helper'

class TestDeletingTrip < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_remove_only_trip
    Trip.create( name: 'foo')
    `ruby trip remove foo`
    assert Trip.all.empty?
  end

  def test_remove_specific_trip
    Trip.create( name: 'a' )
    Trip.create( name: 'b' )
    Trip.create( name: 'c' )
    assert !Trip.where( name: 'b').all.empty?
    `ruby trip remove b`
  end
end