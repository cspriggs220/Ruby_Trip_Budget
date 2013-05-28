require_relative '../test_helper'

class TestLinkingExpenseWithBudget < MiniTest::Unit::TestCase
  include DatabaseCleaner

  # def test_list_with_no_expenses
  #   trip     = Trip.create( name: 'Boston' )
  #   category = Category.create( name: 'Other' )
  #   Budget.create( trip_id: trip.id, category_id: category.id, total: 95 )
  #   actual = `ruby trip expense list Boston`
  #   assert_equal "There are no expenses for the Boston trip.\n", actual
  # end

  def test_list_with_expenses
    trip = Trip.create( name: 'Boston' )
    food = Category.create( name: 'Food' )
    other = Category.create( name: 'Other' )
    b_food = Budget.create( trip_id: trip.id, category_id: food.id, total: 250)
    b_other = Budget.create( trip_id: trip.id, category_id: other.id, total: 75)
    trip.expenses.create( amount: 25, budget_id: b_food.id )
    trip.expenses.create( amount: 33, budget_id: b_other.id )
    expected = <<EOS
Boston Expense List
1. Food 25
2. Other 33
EOS
    actual = `ruby trip expense list Boston`
    assert_equal expected, actual
  end

end