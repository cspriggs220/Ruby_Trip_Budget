class ExpenseController
  attr_accessor :params

  def initialize params
    @params = params
  end

  def create
    trip     = Trip.where( name: params[:trip][:name] ).first
    category = Category.where( name: params[:category][:name] ).first
    budget   = Budget.where( trip_id: trip.id, category_id: category.id ).first
    trip.expenses.create( amount: params[:amount][:integer], budget_id: budget.id )
    puts "#{category.name} expense created for #{trip.name}"
  end

  # def category_name
  # end

  def get_balance
    matching_trip = Trip.where( name: params[:trip][:name] ).first
    budget = Budget.where( trip_id: matching_trip.id )
    totals = 0
    budget.each do |b|
      totals += b.total
      puts b.category.name.ljust(15) + " - " + b.total.to_s
    end
    puts "Total #{matching_trip.name} Budget: $#{totals}"
  end

  def update_budget
    # get category balance from budget on db
    # subtract expenses that belong to that category
    #
  end

  def index
    trip_name = params[:category][:name]
    trip = Trip.where( name: trip_name ).first
    string = ""
    if trip.expenses.exists?
      string += "#{trip.name} Expense List\n"
      category = trip.categories.collect{ |c| c.name }
      expenses = trip.expenses.collect{ |e| e.amount }.flatten
      list = category.zip(expenses)
      list.each_with_index { |list, i|
        string += "#{i+1}. #{list.join(" ")}\n"
      }
      puts string
    else
      puts "There are no expenses for the #{trip.name} trip."
    end
  end

end