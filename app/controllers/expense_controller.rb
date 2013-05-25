class ExpenseController
  attr_accessor :params

  def initialize params
    @params = params
  end

  def create
    trip     = Trip.where( name: params[:trip][:name] ).first
    category = Category.where( name: params[:category][:name] ).first
    budget   = Budget.where( trip_id: trip.id, category_id: category.id ).first
    # Expense.create( amount: params[:amount][:integer], budget_id: budget.id )
    budget.expenses.create( amount: params[:amount][:integer] )
  end
end