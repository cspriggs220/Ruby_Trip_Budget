class CategoryController
  attr_accessor :params

  CATEGORIES = %w{ Food Entertainment Lodging Airfare Fuel Shopping Other}

  def initialize params
    @params = params
  end

  def index
    string = "Available Expense Categories\n"
    CATEGORIES.each_with_index { |cat, i|
      string += "#{i + 1}. #{cat}\n"
    }
    puts string
  end

end