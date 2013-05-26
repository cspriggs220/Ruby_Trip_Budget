class ExpenseController
  attr_accessor :params

  def initialize params
    @params = params
  end

  def create
    trip     = Trip.where( name: params[:trip][:name] ).first
    category = Category.where( name: params[:category][:name] ).first
    budget   = Budget.where( trip_id: trip.id, category_id: category.id ).first
    budget.expenses.create( amount: params[:amount][:integer] )
  end

  def index
    # find the trip
    # find the budget.expenses by category
    trip_name = params[:category][:name]
    trip = Trip.where( name: trip_name ).first
    budget = Budget.where( trip_id: trip.id )
    if Expense.exists?
      string = "#{trip.name} Expense List\n"
      totals = 0
      budget.each do |b|
        totals += b.total
        puts b.category.name
      end
      expenses = trip.budgets.collect{ |b| b.expenses }.flatten
      # expenses.each do |e| puts e.amount end
      expenses.each_with_index { |e, i|
        puts "#{i}. #{e.amount}"
       string += "#{i+1}. $#{e.amount}\n"
      }
      puts string
      # total expenses: $n
    else
      puts "There are no expenses for the #{trip.name} trip."
    end
  end

end