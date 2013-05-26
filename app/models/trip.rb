class Trip < ActiveRecord::Base
  has_many :categories, through: :budgets
  has_many :budgets

  validates_uniqueness_of :name, message: "must be unique"
end