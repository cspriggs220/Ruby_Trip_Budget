class CategoryController
  include ExpenseCategories

  attr_accessor :params

  def index
    string = "Available Expense Categories\n"
    CATEGORIES.each_with_index { |cat, i|
      string += "#{i + 1}. #{cat}\n"
    }
    puts string
  end

end