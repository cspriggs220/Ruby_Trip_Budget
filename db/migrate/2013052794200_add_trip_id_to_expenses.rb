class AddTripIdToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :trip_id, :integer
  end
end