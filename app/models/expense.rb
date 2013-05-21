class Expense < ActiveRecord::Base
  belongs_to :trip
  belongs_to :category

  scope :by_category, ->(category){
    where(categories: {id: category.id})
  }
  scope :large, where("amount > 10000")

  scope :by_budget, ->(budget){
    by_category(budget.category).
    where(expenses: {trip_id: budget.trip_id})
  }

end

#  trip.expenses.large.by_category(category).each
#  trip.expenses.large.by_budget(budget)