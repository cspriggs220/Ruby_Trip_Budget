require_relative '../test_helper'

class TestLinkingExpenseWithBudget < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_list_with_no_expenses
    trip     = Trip.create( name: 'Boston' )
    category = Category.create( name: 'Other' )
    Budget.create( trip_id: trip.id, category_id: category.id, total: 95 )
    expected = """
-------------------------------------------
There are no expenses for the Boston trip.
-------------------------------------------
"""
    actual = `ruby trip expense list Boston`
    assert_equal expected, actual
  end

  def test_list_with_expenses
    trip = Trip.create( name: 'Boston' )
    food = Category.create( name: 'Food' )
    other = Category.create( name: 'Other' )
    b_food = Budget.create( trip_id: trip.id, category_id: food.id, total: 250)
    b_other = Budget.create( trip_id: trip.id, category_id: other.id, total: 75)
    trip.expenses.create( amount: 25, budget_id: b_food.id )
    trip.expenses.create( amount: 33, budget_id: b_other.id )
    expected = """
-------------------------------------------
Boston Expense List

1. Food $25 || Food Balance: $225

2. Other $33 || Other Balance: $42
-------------------------------------------
"""
    actual = `ruby trip expense list Boston`
    assert_equal expected, actual
  end

end