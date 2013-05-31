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
    unless budget == nil
      trip.expenses.create( amount: amount, budget_id: budget.id )
      puts "\n" + "Expense created for #{trip.name}: #{category.name} $#{amount}"
    else
      puts "\n" + "Error: Run `./trip set #{trip.name} #{category.name} (amount)` to set a budget for this category in order to create an expense."
    end
  end

  def index
    trip_name = params[:category][:name]
    trip = Trip.where( name: trip_name ).first
    string = ""
    if trip.expenses.exists?
      trip.budgets.joins(:category).where("category_id is not null").each {|budget|
        total = budget.expenses.sum(:amount) #expenses.greater_than_zero.sum
      string += "\n" "#{budget.category.name} $#{total} || #{budget.category.name} Balance: $#{budget.total-total}\n"
      }
      puts string
    else
      puts "There are no expenses for the #{trip.name} trip."
    end
  end

end