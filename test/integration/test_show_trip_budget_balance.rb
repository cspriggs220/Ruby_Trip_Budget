require_relative '../test_helper'

class TestShowTripBudgetBalance < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_listing_single_category_budgets
    trip = Trip.create( name: 'Austin' )
    cat  = Category.create( name: 'Food' )
    Budget.create( trip_id: trip.id, category_id: cat.id, total: 100 )
    expected = "\n-------------------------------------------\nFood            - $100\n\nTotal Austin Budget: $100\n-------------------------------------------\n"
    actual = `ruby trip balance Austin`
    assert_equal expected, actual
  end

  def test_listing_multiple_category_budgets
    trip    = Trip.create( name: 'Austin' )
    food    = Category.create( name: 'Food' )
    ent     = Category.create( name: 'Entertainment' )
    lodging = Category.create( name: 'Lodging' )
    Budget.create( trip_id: trip.id, category_id: food.id, total: 100 )
    Budget.create( trip_id: trip.id, category_id: ent.id, total: 300 )
    Budget.create( trip_id: trip.id, category_id: lodging.id, total: 500 )
    expected = "\n-------------------------------------------\nFood            - $100\nEntertainment   - $300\nLodging         - $500\n\nTotal Austin Budget: $900\n-------------------------------------------\n"
    actual = `ruby trip balance Austin`
    assert_equal expected, actual
  end


end