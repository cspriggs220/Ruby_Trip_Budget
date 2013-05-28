require_relative '../test_helper'

class TestLinkingExpenseWithBudget < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_linking_expense_with_budget
    Trip.create( name: 'Dallas' )
    Category.create( name: 'Food' )
    trip = Trip.where( name: 'Dallas' ).first
    category = Category.where( name: 'Food' ).first
    `ruby trip set Dallas Food 300`
    budget   = Budget.where( trip_id: trip.id, category_id: category.id ).first
    budget.expenses.create( amount: 38 )
    assert_equal 1, budget.expenses.count
  end

  def test_multiple_expenses_in_single_budget
    Trip.create( name: 'Austin' )
    Category.create( name: 'Fuel' )
    Category.create( name: 'Shopping' )
    `ruby trip set Austin Fuel 380`
    `ruby trip set Austin Shopping 175`
    trip         = Trip.where( name: 'Austin' ).first
    cat_fuel     = Category.where( name: 'Fuel' ).first
    cat_shop     = Category.where( name: 'Shopping' ).first
    b_fuel       = Budget.where( trip_id: trip.id, category_id: cat_fuel.id ).first
    b_shop       = Budget.where( trip_id: trip.id, category_id: cat_shop.id ).first
    expense_fuel = b_fuel.expenses.create( amount: 53 )
    expense_shop = b_shop.expenses.create( amount: 114 )
    assert_equal b_fuel.id, expense_fuel.budget_id
    assert_equal b_shop.id, expense_shop.budget_id
  end
end