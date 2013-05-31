class Expense < ActiveRecord::Base
  belongs_to :budget
  belongs_to :trip
  has_one :category, through: :budgets

  scope :greater_than_zero, where("amount > 0")
end

# scope :by_category, ->(category){
#   where(categories: {id: category.id})
# }
# scope :large, where("amount > 10000")

# scope :by_budget, ->(budget){
#   by_category(budget.category).
#   where(expenses: {trip_id: budget.trip_id})
# }

#  trip.expenses.large.by_category(category).each
#  trip.expenses.large.by_budget(budget)