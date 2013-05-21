require_relative '../test_helper'

class TestListingCategories < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_listing_available_categories
    expected = <<EOS
Available Expense Categories
1. Food
2. Entertainment
3. Lodging
4. Airfare
5. Fuel
6. Shopping
7. Other
EOS
    actual = `ruby trip cat`
    assert_equal expected, actual
  end
end