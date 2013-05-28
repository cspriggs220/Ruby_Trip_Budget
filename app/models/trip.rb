class Trip < ActiveRecord::Base
  has_many :budgets
  has_many :expenses
  has_many :categories, through: :budgets

  validates_uniqueness_of :name, message: "must be unique"
end