class TripController

  attr_accessor :params

  def initialize params
    @params = params
  end

  def create
    trip = Trip.create( params[:trip] )
    if trip.save
      puts "\nSuccessfully added new trip #{trip.name}"
    else
      puts "\nFailed: #{trip.errors.full_messages.join(", ")}."
    end
  end

  def index
    if Trip.count == 0
      puts "There are no trips to list. Please run `./trip add <trip-name>`" +
           " to add a trip."
    else
      string = "\nTrip List\n"
      string += "-------------------------------------------"
      trips = Trip.all
      trips.each_with_index { |trip, i|
       string += "\n#{i+1}. #{trip.name}\n"
      }
      string += "-------------------------------------------"
      puts string
    end
  end

  def set_category_budget
    category  = Category.where( name: params[:category][:name] ).first
    total = params[:amount][:integer]
    if category
      trip   = Trip.where( name: params[:trip][:name] ).first
      budget = trip.budgets.create( category: category, total: total )
      puts "\nBudget successfully created for your #{trip.name} trip!\n" +
           "Category: #{category.name}\nBudget: #{budget.total}"
    else
      puts "\nFailed to set budget. Please run `./trip cat` for a list" +
           " of available categories."
    end
  end

  def get_balance
    trip = Trip.where( name: params[:trip][:name] ).first
    totals = 0
    string = "\n-------------------------------------------"
    trip.budgets.each do |b|
      totals += b.total
      string += "\n" + b.category.name.ljust(15) + " - " + b.total.to_s
    end
    string += "\n-------------------------------------------"
    string += "\nTotal #{trip.name} Budget: $#{totals}"
  end

  def print_budget_balance
    puts get_balance
  end

  def destroy
    # add warning about removing a trip, prompt the user to type y or n
    # add message stating #{trip} has been removed
    # gets
    trips = Trip.where(name: params[:trip][:name]).all
    trips.each do |trip|
      trip.destroy
    end
  end


end