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
    `ruby trip expense Dallas Food 38`
    assert_equal budget.id, Expense.last.id
  end

  def test_multiple_expenses_in_single_budget
    Trip.create( name: 'Austin' )
    Category.create( name: 'Fuel' )
    # ent  = Category.create( name: 'Entertainment' )
    # shop = Category.create( name: 'Shopping' )
    trip    = Trip.where( name: 'Austin' ).first
    fuel    = Category.where( name: 'Fuel' ).first
    `ruby trip set Austin Fuel 380`
    b       = Budget.where( trip_id: trip.id, category_id: fuel.id ).first
    # `ruby trip expense Austin Food 78`
    expense = b.expenses.create( amount: 78 )
    # e = Expense.create( amount: 78, budget_id: b.id )
    # `ruby trip expense Austin Entertainment 65`
    # `ruby trip expense Austin Shopping 112`
    assert_equal 78, expense.amount
    assert_equal b.id, expense.budget_id
  end

end