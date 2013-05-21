class Trip < ActiveRecord::Base
  has_many :budgets
  has_many :expenses
  has_many :categories, through: :budgets

  # has_one  :trip_budget, condition: {category_id: nil}, class_name: "Budget"

  validates_uniqueness_of :name, message: "must be unique"
end