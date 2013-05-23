require_relative '../test_helper'

class TestShowTripBudgetBalance < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_listing_category_budget
    Trip.create( name: 'Austin' )
    Category.create( name: 'Food' )
    Budget.create()
    `ruby trip set Austin Food 100`
    # expected = "Food            - 100            \nTotal Austin Budget: $100\n"
    expected = <<EOS
Food            - 100
Total Austin Budget: $100
EOS
    actual = `ruby trip balance Austin`
    assert_equal expected, actual
  end
end