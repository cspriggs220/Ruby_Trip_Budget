class TripController
  include ExpenseCategories

  attr_accessor :params

  def initialize params
    @params = params
  end

  def create
    trip = Trip.create( params[:trip] )
    if trip.save
      puts "Successfully added new trip #{trip.name}"
    else
      puts "Failed: #{trip.errors.full_messages.join(", ")}."
    end
  end

  def index
    string = "Trip List\n"
    trips = Trip.all
    trips.each_with_index { |trip, i|
     string += "#{i+1}. #{trip.name}\n"
    }
    puts string
  end

  def set_category_budget
    if CATEGORIES.include?( params[:category][:name] )
      matching_trip = Trip.where( name: params[:trip][:name] ).first
      matching_cat  = Category.where( name: params[:category][:name] ).first
      new_budget    = Budget.create( trip_id: matching_trip.id, category_id: matching_cat.id, total: params[:amount][:integer] )

      puts "Budget successfully created for your #{matching_trip.name} trip!\nCategory: #{matching_cat.name}\nBudget: #{new_budget.total}"
    else
      puts "Failed to set budget. Please run `./trip cat` for a list of available categories."
    end
  end

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


  def destroy
    # add warning about removing a trip, prompt the user to type y or n
    # add message stating #{trip} has been removed
    matching_trips = Trip.where(name: params[:trip][:name]).all
    matching_trips.each do |trip|
      trip.destroy
    end
  end


end