class Budget < ActiveRecord::Base
  belongs_to :trip
  belongs_to :category

  scope :with_expense_totals, ->(){
    joins(:category).
    joins("JOIN expenses ON expenses.category_id = budgets.category_id AND expenses.trip_id = budgets.trip_id").
    group("budgets.*").
    select("budgets.*, sum(expenses.amount) as total_expenses, categories.name as category_name")
  }
end




# trip.budgets.with_expense_totals.each {|budget|
#   p [budget['category_name'], budget['total_expenses'].to_i, budget.total]
# }