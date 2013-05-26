require 'minitest/autorun'
require_relative '../bootstrap_ar'

connect_to 'test'

ENV['FP_ENV'] = 'test'

module DatabaseCleaner
  def before_setup
    super
    Trip.destroy_all
    # Category.destroy_all
    # Budget.destroy_all
    # Expense.destroy_all
  end
end
