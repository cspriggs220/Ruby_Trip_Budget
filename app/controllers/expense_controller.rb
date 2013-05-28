class ExpenseController
  attr_accessor :params

  def initialize params
    @params = params
  end

  def create
    amount   = params[:amount][:integer]
    trip     = Trip.where( name: params[:trip][:name] ).first
    category = Category.where( name: params[:category][:name] ).first
    budget   = Budget.where( trip_id: trip.id, category_id: category.id ).first
    unless budget == nil
      trip.expenses.create( amount: amount, budget_id: budget.id )
      puts "Expense created for #{trip.name}: #{category.name} #{amount}"
    else
      puts "Error: Run `./trip set #{trip.name} #{category.name} (amount)` to set a budget for this category in order to create an expense."
    end
  end

  def index
    trip_name = params[:category][:name]
    trip = Trip.where( name: trip_name ).first
    string = ""
    if trip.expenses.exists?
      budget = trip.budgets.collect{ |b| b.total }
      string += "#{trip.name} Expense List\n"
      category = trip.categories.collect{ |c| c.name }
      expenses = trip.expenses.collect{ |e| e.amount }
      list = category.zip(expenses)
      list.each_with_index { |list, i|
        c = 0
        string += "#{i+1}. #{list.join(" ")} || #{list[c]} Balance - $#{budget[i]-list[c+1]}\n"
        c += 1
      }
      puts string
    else
      puts "There are no expenses for the #{trip.name} trip."
    end
  end

end