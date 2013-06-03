class ExpenseController
  attr_accessor :params

  def initialize params
    @params = params
  end

  def create
    amount   = params[:amount][:integer]
    trip     = Trip.where( name: params[:trip][:name] ).first
    category = Category.where( name: params[:category][:name] ).first
    budget   = trip.budgets.where( category_id: category.id ).first
    if budget
      trip.expenses.create( amount: amount, budget: budget )
      puts "\nExpense created for #{trip.name}: #{category.name} $#{amount}"
    else
      puts "\nError: Run `./trip set #{trip.name} #{category.name}" +
           " (amount)` to set a budget for this category in order to create an expense."
    end
  end

  def index
    # trip_name = params[:category][:name]
    trip = Trip.where( name: params[:category][:name] ).first
    string = "\n#{trip.name} Expense List\n"
    if trip.expenses.exists?
      trip.budgets.joins(:category).where("category_id is not null").each_with_index {
      |budget, i|
        total = budget.expenses.sum(:amount)
        string += "\n#{i+1}. #{budget.category.name} $#{total} || #{budget.category.name} Balance: $#{budget.total-total}\n"
      }
      return string
    else
      return "There are no expenses for the #{trip.name} trip."
    end
  end

  def print_expense_balance
    puts index
  end

end