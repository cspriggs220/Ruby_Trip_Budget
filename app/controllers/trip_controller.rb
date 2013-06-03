class TripController
  include ExpenseCategories

  attr_accessor :params

  def initialize params
    @params = params
  end

  def create
    trip = Trip.create( params[:trip] )
    if trip.save
      puts "\n" + "Successfully added new trip #{trip.name}"
    else
      puts "\n" + "Failed: #{trip.errors.full_messages.join(", ")}."
    end
  end

  def index
    if Trip.count == 0
      puts "There are no trips to list. Please run `./trip add <trip-name>` to add a trip."
    else
      string = "\n" "Trip List\n"
      string += "-------------------------------------------"
      trips = Trip.all
      trips.each_with_index { |trip, i|
       string += "\n" + "#{i+1}. #{trip.name}\n"
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
    matching_trip = Trip.where( name: params[:trip][:name] ).first
    budget = Budget.where( trip_id: matching_trip.id )
    totals = 0
    string = "\n"
    string += "-------------------------------------------"
    budget.each do |b|
      totals += b.total
      string += "\n" + b.category.name.ljust(15) + " - " + b.total.to_s
    end
    string += "\n"
    string += "-------------------------------------------"
    string += "\n"
    puts string + "Total #{matching_trip.name} Budget: $#{totals}"
  end


  def destroy
    # add warning about removing a trip, prompt the user to type y or n
    # add message stating #{trip} has been removed
    # gets
    matching_trips = Trip.where(name: params[:trip][:name]).all
    matching_trips.each do |trip|
      trip.destroy
    end
  end


end