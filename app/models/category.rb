class Category < ActiveRecord::Base
  has_many :budgets
end