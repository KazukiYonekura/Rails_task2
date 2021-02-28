class ChangeRservesionsToReservations < ActiveRecord::Migration[6.1]
  def change
  	rename_table :rservesions, :reservations
  end
end
