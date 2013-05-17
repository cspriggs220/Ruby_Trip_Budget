require 'test_helper'

class TestAddingTrip < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_takes_arguments_and_saves_them
    assert_equal 0, Trip.count
    `ruby trip add foo`
    assert_equal 1, Trip.count
  end

  def test_takes_arguments_and_uses_them
    `ruby trip add foo`
    assert_equal 'foo', Trip.last.name
  end

  def test_duplicate_names_are_ignored
    Trip.create( name: 'foo' )
    original_trip_count = Trip.count
    `ruby trip add foo`
    assert_equal original_trip_count, Trip.count
  end

  def test_duplicate_names_outputs_error_message
    Trip.create( name: 'foo' )
    results = `ruby trip add foo`
    assert results.include?('Name must be unique'),results
  end
end

