class TripController
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

  def destroy
    matching_trips = Trip.where(name: params[:trip][:name]).all
    matching_trips.each do |trip|
      trip.destroy
    end
  end

end