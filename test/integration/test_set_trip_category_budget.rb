require_relative '../test_helper'

class TestSetTripCategoryBudget < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_get_category
    Category.create( name: 'Food' )
    Category.create( name: 'Entertainment' )
    assert_equal 'Food', Category.first.name
  end

  def test_linking_trip_and_category_with_budget
    Category.create( name: 'Food' )
    trip     = Trip.create( name: 'Memphis' )
    category = Category.where( name: 'Food' ).first
    budget   = Budget.create( trip_id: trip.id,
      category_id: category.id, total: 45 )
    assert_equal 45, budget.total
  end

  def test_set_trip_category_budget
    Category.create( name: 'Food' )
    Trip.create( name: 'Memphis' )
    actual   = `ruby trip set Memphis Food 100`
    expected = <<EOS
Budget successfully created for your Memphis trip!
Category: Food
Budget: 100
EOS
    assert_equal expected, actual
  end
end