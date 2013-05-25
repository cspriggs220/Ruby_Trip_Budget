require_relative '../test_helper'

class TestShowTripBudgetBalance < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_listing_single_category_budgets
    Trip.create( name: 'Austin' )
    Category.create( name: 'Food' )
    `ruby trip set Austin Food 100`
    expected = <<EOS
Food            - 100
Total Austin Budget: $100
EOS
    actual = `ruby trip balance Austin`
    assert_equal expected, actual
  end

  def test_listing_multiple_category_budgets
    Trip.create( name: 'Austin' )
    Category.create( name: 'Food' )
    Category.create( name: 'Entertainment' )
    Category.create( name: 'Lodging' )
    Category.create( name: 'Airfare' )
    Category.create( name: 'Fuel' )
    Category.create( name: 'Shopping' )
    Category.create( name: 'Other' )
    `ruby trip set Austin Food 100`
    `ruby trip set Austin Entertainment 300`
    `ruby trip set Austin Lodging 500`
    `ruby trip set Austin Airfare 0`
    `ruby trip set Austin Fuel 200`
    `ruby trip set Austin Shopping 250`
    `ruby trip set Austin Other 150`
    expected = <<EOS
Food            - 100
Entertainment   - 300
Lodging         - 500
Airfare         - 0
Fuel            - 200
Shopping        - 250
Other           - 150
Total Austin Budget: $1500
EOS
    actual = `ruby trip balance Austin`
    assert_equal expected, actual
  end


end