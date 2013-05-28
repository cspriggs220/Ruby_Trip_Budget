class Category < ActiveRecord::Base
  has_many :budgets
  has_many :trips, through: :budgets
  has_many :expenses, through: :budgets
end