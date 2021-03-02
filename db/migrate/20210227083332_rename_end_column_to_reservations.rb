class RenameEndColumnToReservations < ActiveRecord::Migration[6.1]
  def change
  	rename_column :reservations, :start, :start_date
  	rename_column :reservations, :end, :end_date
  end
end
