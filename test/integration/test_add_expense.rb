require_relative '../test_helper'

class TestAddExpense < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_take_expense_arguments
    assert_equal 0, Expense.count
    Trip.create( name: 'Dallas' )
    Category.create( name: 'Food' )
    `ruby trip set Dallas Food 150`
    `ruby trip expense Dallas Food 28`
    assert_equal 1, Expense.count
  end

  def test_take_expense_arguments_and_use_them
    Trip.create( name: 'Dallas' )
    Category.create( name: 'Food' )
    `ruby trip set Dallas Food 150`
    `ruby trip expense Dallas Food 28`
    assert_equal 28, Expense.last.amount
  end

end
